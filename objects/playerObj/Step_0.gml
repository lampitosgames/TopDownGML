///@description Move the player based on inputs

//The current directional vector based on inputs from a keyboard or a gamepad.  If a gamepad is used, it also carries joystick information (the player isn't moving the stick fully in any direction)
var curDirVec = global.in[dirVec];
//Current player velocity.  Save into vector
var vel = [phy_linear_velocity_x, phy_linear_velocity_y];
//Duplicate the max speed so modifiers can be used without changing the orignal
var movementSpeed = maxSpeed;

//Check if the player is on the floor
isInPitfall = isPlayerInPitfall();

//If the player is not jumping
if (!isJumping && !isInPitfall && !falling) {
	//Save this as the last safe location.  Subtract 1/10 of the velocity from the location to make sure the player lands safely
	var pos = [phy_position_x, phy_position_y];
	var scaledNegVel = vscaleTo(-0.1, vel);
	lastSafePos = vaddTo(pos, scaledNegVel);
	
	//Check for sprinting/sneaking
	movementSpeed = sprintSneakCheck(movementSpeed);
	
	//Move based on input
	moveBasedOnInput(movementSpeed, vel);
	
	//Decriment the jump cooldown
	jumpTimer -= 1;
	//Detect jump input and start jumping if found
	startPlayerJump();

//The player is currently jumping
} else if (isJumping) {
	//Decriment the jump timer.
	jumpTimer -= 1;
	//At the end of the jump, stop jumping
	if (jumpTimer <= 0) {
		isJumping = false;
		jumpTimer = floor(global.stepsInSecond/jumpCooldownMod);
	}

//The player is falling
} else {
	//Handle falling
	handlePlayerFalling(vel);
}