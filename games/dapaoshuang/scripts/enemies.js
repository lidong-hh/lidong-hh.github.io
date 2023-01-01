/**
 * 敌人类
 */
function Enemies(canvas, context) {
	var indicator = arguments.callee;

	//每个圆圈在舞台上的信息
	var _allInfo = [];
	var _length = _allInfo.length;
	init();

	var img = new Image();
	img.src = "images/monster.png";

	//缓存canvas
	var canvasBuffer = document.createElement("canvas");
	var contextBuffer = canvas.getContext("2d");
	context.drawImage(canvasBuffer, 0, 0);

	function init() {
		_allInfo = [];
		for(var k = 0; k < 10; k++) {
			var _one = {};
			_one.x = Math.random() * 560;
			_one.y = 0;
			_one.v = Math.random() * 10;
			_one.po = {
				co : [[0, 0], [100, 0]],
				width : 76,
				height : 115
			};
			_one.bomb = {
				co : [[4, 559], [185, 559], [375, 559], [560, 559], [748, 559]],
				width : 155,
				height : 117
			};
			_one.index = 0;
			_one.count = 0;
			_one.sta = "po";
			_one.timeLine = 0;
			_allInfo.push(_one);
		}
		_length = _allInfo.length;
	}

	indicator.prototype.init = init;

	var _timeLine = 0;
	indicator.prototype.play = function() {
		for(var i = 0; i < _length; i++) {
			if(_allInfo[i].timeLine = parseInt(_allInfo[i].v - 3)) {
				_allInfo[i].timeLine++;
				_allInfo[i].index -= 1;
			} else {
				_allInfo[i].timeLine = 0;
			}
			_allInfo[i].index = _allInfo[i].index < 0 ? 0 : _allInfo[i].index;
			contextBuffer.drawImage(img, _allInfo[i][_allInfo[i].sta].co[_allInfo[i].index][0], _allInfo[i][_allInfo[i].sta].co[_allInfo[i].index][1], _allInfo[i][_allInfo[i].sta].width, _allInfo[i][_allInfo[i].sta].height, _allInfo[i].x, this.flowDown(_allInfo[i]), _allInfo[i][_allInfo[i].sta].width, _allInfo[i][_allInfo[i].sta].height);
			_allInfo[i].index++;
			if(_allInfo[i].index > _allInfo[i][_allInfo[i].sta].co.length - 1) {
				_allInfo[i].index = 0;
			}
		}
		this.bombing();
	}
	//自由落体公式的时间
	var t = 1;

	var overCount = 0;
	//物体下落方法
	indicator.prototype.flowDown = function(obj) {
		obj.y += obj.v * t + 0.5 * 0.98 * t * t;
		if(obj.y > 900) {
			obj.y = -150;
			obj.v = Math.random() * 10;
			obj.x = Math.random() * 560;
			overCount++;
		}
		this.check();
		return obj.y;
	}
	//子弹（此处处理应该放在子弹中）
	var bullet = null;
	//获取子弹对象（此处处理应该放在子弹中）
	indicator.prototype.getBullet = function(obj) {
		bullet = obj;
	}
	var _cache = [];
	//测试碰撞（此处处理应该放在子弹中）
	indicator.prototype.check = function() {
		//如果没有检测到子弹，则不做碰撞检测
		if(bullet == null) {
			return;
		}
		//获取当前子弹的坐标
		var arr = bullet.getPo();
		for(var i = 0; i < _length; i++) {
			if(arr[0] > _allInfo[i].x && arr[0] < _allInfo[i].x + _allInfo[i][_allInfo[i].sta].width && arr[1] > _allInfo[i].y && arr[1] < _allInfo[i].y + _allInfo[i][_allInfo[i].sta].height) {
				//当前碰撞的敌人消亡
				_cache.push(i);
				//碰撞后子弹死亡
				if(bullet != null) {
					bullet.die();
					bullet = null;
				}
			}
		}
	}
	//获取积分信息
	indicator.prototype.getScoreInfo = function() {
		return [score, overCount];
	}
	//获取积分信息
	indicator.prototype.initScore = function() {
		score = 0;
		overCount = 0;
	}
	//分数
	var score = 0;
	//测试碰撞（此处处理应该放在子弹中）
	indicator.prototype.bombing = function() {
		var _temp = _cache[0];
		if(_temp != undefined) {
			_allInfo[_temp].count++;
			if(_allInfo[_temp].count == 6) {
				_allInfo[_temp].y = -150;
				_allInfo[_temp].v = Math.random() * 10;
				_allInfo[_temp].x = Math.random() * 560;
				_allInfo[_temp].count = 0;
				_allInfo[_temp].sta = "po";
				_cache.shift();
				score++;
			} else {
				_allInfo[_temp].sta = "bomb";
			}
		}
	}
}