/**
 * 子弹类
 */
function Bullets(canvas, context) {
	var indicator = arguments.callee;

	//每个圆圈在舞台上的信息
	var _allInfo = [];
	for(var k = 0; k < 1; k++) {
		var _one = {};
		_one.x = 400;
		_one.y = 710;
		_one.v = Math.random() * 10;
		_one.width = 0;
		_one.height = 60;
		_one.b = false;
		_allInfo.push(_one);
	}
	var _length = _allInfo.length;
	var img = new Image();
	img.src = "images/bullet.png";

	//缓存canvas
	var canvasBuffer = document.createElement("canvas");
	var contextBuffer = canvas.getContext("2d");
	context.drawImage(canvasBuffer, 0, 0);

	//为扩展备用，子弹采用索引
	var currentIndex;
	indicator.prototype.play = function(index) {
		if(index == undefined) {
			index = 0;
		}
		currentIndex = index;
		contextBuffer.drawImage(img, 0, 0, _allInfo[index].width, _allInfo[index].height, _allInfo[index].x, _allInfo[index].y, _allInfo[index].width, _allInfo[index].height);
		this.move(_allInfo[index]);
	}
	
	//两点间坐标差值
	var _x1;
	var _y1;
	//两点间距离
	var _dis;
	indicator.prototype.run = function(obj) {
		if(_isMoving) {
			return;
		}
		//向量跟踪射击
		_x1 = obj.x - _allInfo[currentIndex].x;
		_y1 = obj.y - 130 - _allInfo[currentIndex].y;
		_dis = Math.sqrt(_x1*_x1+_y1*_y1);
		//向量跟踪射击end
		_allInfo[currentIndex].b = true;
	}
	
	//获取当前坐标信息
	indicator.prototype.getPo = function() {
		return [_allInfo[currentIndex].x, _allInfo[currentIndex].y];
	}
	
	//是否移动中
	var _isMoving = false;
	//子弹移动方法
	indicator.prototype.move = function(obj) {
		if(obj.b) {
			//向量跟踪射击
			obj.x += 70 * _x1/_dis;
			obj.y += 70 * _y1/_dis;
			//向量跟踪射击end
			obj.width = 25;
			_isMoving = true;
			if(obj.x > 640 || obj.y > 960 || obj.x < 0 || obj.y < 0) {
				this.die();
			}
		}
	}
	
	//子弹死亡方法
	indicator.prototype.die = function() {
		_allInfo[currentIndex].x = 400;
		_allInfo[currentIndex].y = 710;
		_allInfo[currentIndex].width = 0;
		_allInfo[currentIndex].b = false;
		_isMoving = false;
	}
}