///@description Move the player based on inputs
//Store player position and velocity
var vel = [phy_linear_velocity_x, phy_linear_velocity_y];
var pos = [phy_position_x, phy_position_y];
//The current directional vector based on inputs from a keyboard or a gamepad.  If a gamepad is used, it also carries joystick information (the player isn't moving the stick fully in any direction)
curDirVec = global.in[dirVec];
//Bounding box for the "feet" of the character
movementBoundingBox = [x-16, y, x+16, y+48];

//If the player is not jumping
if (!movement.isJumping && !movement.isInPitfall && !movement.falling && !global.paused) {
	//Scale the curDirVec by sprint/sneak modifiers if the player is sprinting/sneaking
	sprintSneakCheck();
	//If the curDirVec is zero, no inputs were detected. The parent object handles damping, so just reset the sprint warmup
	if (visZero(curDirVec)) {
		sprintWarmupCounter = 0;
	}
	//Override the parent's jumping code
	startPlayerJump();
}
