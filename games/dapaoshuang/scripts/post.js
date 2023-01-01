/**
 * 准星
 */
function Post(canvas, context) {
	var indicator = arguments.callee;

	//每个圆圈在舞台上的信息
	var _allInfo = {
		yellow : {
			x:142,
			y:149,
			width:162,
			height:156
		},
		black : {
			x:0,
			y:150,
			width:122,
			height:122
		}
	};
	
	var img = new Image();
	img.src = "images/UI.png";

	//缓存canvas
	var canvasBuffer = document.createElement("canvas");
	var contextBuffer = canvas.getContext("2d");
	context.drawImage(canvasBuffer, 0, 0);

	//为扩展备用，子弹采用索引
	var currentIndex = 0;
	var status = "black";
	indicator.prototype.play = function(obj) {
		contextBuffer.drawImage(img, _allInfo[status].x, _allInfo[status].y, _allInfo[status].width, _allInfo[status].height, obj.x - 65, obj.y - 200, _allInfo[status].width, _allInfo[status].height);
	}
	
	//改变状态
	indicator.prototype.changeStatus = function(value){
		status = (value == 0?("black"):("yellow"));
	} 
}