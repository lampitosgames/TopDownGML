///@description Move the player based on inputs
//Store player position and velocity
var vel = [phy_linear_velocity_x, phy_linear_velocity_y];
var pos = [phy_position_x, phy_position_y];
//The current directional vector based on inputs from a keyboard or a gamepad.  If a gamepad is used, it also carries joystick information (the player isn't moving the stick fully in any direction)
curDirVec = global.in[dirVec];

//If the player is not jumping
if (!isJumping && !isInPitfall && !falling && !global.paused) {
	//Scale the curDirVec by sprint/sneak modifiers if the player is sprinting/sneaking
	sprintSneakCheck();
	//If the curDirVec is zero, no inputs were detected. The parent object handles damping, so just reset the sprint warmup
	if (visZero(curDirVec)) {
		sprintWarmupCounter = 0;
	}
	//Override the parent's jumping code
	startPlayerJump();
}
//Call the parent step event
event_inherited();
