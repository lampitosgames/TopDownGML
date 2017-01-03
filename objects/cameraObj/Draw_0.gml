/// @description Insert description here
if (global.debug) {
	draw_self();
	//Draw approach distance
	draw_circle_color(cameraTargetPos[0], cameraTargetPos[1], slowingDistance, c_blue, c_blue, true);
	//Draw target offset vector
	draw_line_color(x+targetOffset[0], y+targetOffset[1], x, y, c_yellow, c_green);
}