/**
 * 准星
 */
function Score(canvas, context) {
	var indicator = arguments.callee;

	//每个圆圈在舞台上的信息
	var _allInfo = {
		co:[[0,0],[133,0],[263,0],[394,0],[524,0],[655,0]],
		width:102,
		height:131
	};
	
	var img = new Image();
	img.src = "images/banana.png";

	//缓存canvas
	var canvasBuffer = document.createElement("canvas");
	var contextBuffer = canvas.getContext("2d");
	context.drawImage(canvasBuffer, 0, 0);

	var status = 0;
	indicator.prototype.play = function(obj) {
		contextBuffer.drawImage(img, _allInfo.co[status][0], _allInfo.co[status][1], _allInfo.width, _allInfo.height, 50, 800, _allInfo.width,  _allInfo.height);
	}
	
	//改变状态
	indicator.prototype.changeStatus = function(value){
		status = value;
	} 
}