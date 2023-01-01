/**
 * 人物类
 */
function Player(canvas, context) {
	var indicator = arguments.callee;

	//人物起始位置
	indicator.x = 60;
	indicator.y = 70;

	var _stageWidth = 640;
	var _stageHeight = 960;

	//人物向下走走动的每一帧
	var _allInfo = {
		up : {
			co : [[6, 0], [219, 0], [436, 0], [654, 0], [871, 0], [1087, 0]],
			width:182,
			height:228,
			count:0
		},
		down : {
			co : [[1, 255], [217, 254], [433, 254], [649, 254], [865, 254], [1082, 254],[1299,254],[1515,254]],
			width:195,
			height:225,
			count:0
		}
	};
	
	var status = "down";

	var img = new Image();
	img.src = "images/monkey1.png";

	//缓存canvas
	var canvasBuffer = document.createElement("canvas");
	var contextBuffer = canvas.getContext("2d");
	context.drawImage(canvasBuffer, 0, 0);

	var _timeLine = 0;
	indicator.prototype.play = function() {
		_timeLine++;
		if(_timeLine == 2){
			_timeLine = 0;
			_allInfo[status].count -= 1;
			_allInfo[status].count = (_allInfo[status].count < 0 ? 0 : _allInfo[status].count);
		}
		contextBuffer.drawImage(img, _allInfo[status].co[_allInfo[status].count][0], _allInfo[status].co[_allInfo[status].count][1], _allInfo[status].width, _allInfo[status].height, (_stageWidth - _allInfo[status].width)/2 - 6, _stageHeight - _allInfo[status].height - 67, _allInfo[status].width, _allInfo[status].height);
		_allInfo[status].count++;
		if(_allInfo[status].count > _allInfo[status].co.length - 1) {
			_allInfo[status].count = 0;
		}
	}
	
	//改变状态
	indicator.prototype.changeStatus = function(value){
		status = (value == 0?("down"):("up"));
	} 
}