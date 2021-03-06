/// @description Step towards the target location
//Get the player's position in the room
var playerIsFalling = false;
var playerPos = [0, 0]
with (playerObj) {
	playerIsFalling = movement.falling;
	playerPos = [x, y];
}
//Get the mouse position
var mousePos = [mouse_x, mouse_y];

if (!playerIsFalling) {
	//Get the target position of the player.  It points in the direction of the mouse from the player
	cameraTargetPos = vsubTo(mousePos, playerPos);
	vscale(0.25, cameraTargetPos);
	vadd(cameraTargetPos, playerPos);

	//Get the offset from the current camera location to the target position
	targetOffset = [cameraTargetPos[0] - x, cameraTargetPos[1] - y];
	//Get the distance
	var distance = vmag(targetOffset);
	//Scale the velocity based on distance from the target position.  Further away means the camera will approach more quickly.
	vel = vsetMagTo(maxSpeed*(distance/slowingDistance), targetOffset);

	x += vel[0];
	y += vel[1];
}