// 
const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const port = 3000;

// 创建存储文件
const MESSAGE_FILE = path.join(__dirname, 'messages.txt');

// 中间件配置
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

// 首页路由
app.get('/', (req, res) => {
fs.readFile(path.join(__dirname, 'public/index.html'), (err, data) => {
res.send(data.toString());
});
});

// 留言提交处理
app.post('/submit', (req, res) => {
const { name, message } = req.body;
const timestamp = new Date().toLocaleString();
const entry = `[${timestamp}] ${name || "匿名"}: ${message}\n`;

fs.appendFile(MESSAGE_FILE, entry, (err) => {
if (err) return res.status(500).send('留言提交失败');
res.redirect('/');
});
});

// 查看所有留言（简易后台）
app.get('/messages', (req, res) => {
fs.readFile(MESSAGE_FILE, 'utf8', (err, data) => {
if (err) return res.status(500).send('无法读取留言');
res.send(`<pre>${data}</pre>`);
});
});

app.listen(port, () => {
console.log(`服务器运行在 http://localhost:${port}`);
});
