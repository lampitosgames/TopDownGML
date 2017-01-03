/// @description Step towards the target location

var playerPos = [0, 0]
with (playerObj) {
	playerPos = [x, y];
}
var mousePos = [mouse_x, mouse_y];

var cameraPos = vsubTo(mousePos, playerPos);
vscale(0.25, cameraPos);

x = playerPos[0] + cameraPos[0];
y = playerPos[1] + cameraPos[1];