const express = require('express');
const session = require('express-session');
const sqlite3 = require('sqlite3').verbose();
const bcrypt = require('bcryptjs');
const app = express();
const port = 3000;

// 初始化数据库
const db = new sqlite3.Database('./messages.db');

db.serialize(() => {
db.run(`CREATE TABLE IF NOT EXISTS messages (
id INTEGER PRIMARY KEY AUTOINCREMENT,
content TEXT,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
is_approved BOOLEAN DEFAULT 0
)`);

db.run(`CREATE TABLE IF NOT EXISTS users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
username TEXT UNIQUE,
password TEXT
)`);
});

// 中间件
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
secret: 'your-secret-key',
resave: false,
saveUninitialized: true
}));

// 前台路由
app.get('/', (req, res) => res.sendFile(__dirname + '/frontend.html'));

app.post('/message', (req, res) => {
const { content } = req.body;
db.run('INSERT INTO messages (content) VALUES (?)', [content], (err) => {
if (err) return res.status(500).send('提交失败');
res.sendStatus(200);
});
});

// 后台路由
const auth = (req, res, next) => {
if (req.session.isAdmin) return next();
res.redirect('/admin/login');
};

app.get('/admin/login', (req, res) => {
res.send(`
<form action="/admin/login" method="post">
<input type="text" name="username" placeholder="用户名" required>
<input type="password" name="password" placeholder="密码" required>
<button type="submit">登录</button>
</form>
`);
});

app.post('/admin/login', (req, res) => {
const { username, password } = req.body;
db.get('SELECT * FROM users WHERE username = ?', [username], (err, user) => {
if (!user || !bcrypt.compareSync(password, user.password)) {
return res.status(401).send('登录失败');
}
req.session.isAdmin = true;
res.redirect('/admin/messages');
});
});

app.get('/admin/messages', auth, (req, res) => {
db.all('SELECT * FROM messages ORDER BY id DESC', [], (err, rows) => {
let html = '<h1>留言管理</h1><table class="table"><tr><th>ID</th><th>内容</th><th>时间</th></tr>';
rows.forEach(row => {
html += `<tr><td>${row.id}</td><td>${row.content}</td><td>${row.created_at}</td></tr>`;
});
html += '</table>';
res.send(html);
});
});

// 创建管理员账号（首次运行后注释掉）
const salt = bcrypt.genSaltSync(10);
const hash = bcrypt.hashSync('admin123', salt);
db.run('INSERT INTO users (username, password) VALUES (?, ?)', ['admin', hash]);

app.listen(port, () => {
console.log(`Server running at http://localhost:${port}`);
});
