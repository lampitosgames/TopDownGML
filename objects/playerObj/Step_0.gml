///@description Move the player based on inputs

//The current directional vector based on inputs from a keyboard or a gamepad.  If a gamepad is used, it also carries joystick information (the player isn't moving the stick fully in any direction)
var curDirVec = global.in[dirVec];
//Current player velocity.  Save into vector
var vel = [phy_linear_velocity_x, phy_linear_velocity_y];
//Duplicate the max speed so modifiers can be used without changing the orignal
var movementSpeed = maxSpeed;

//If the player is not jumping
if (!isJumping) {
	//Check for sprinting/sneaking
	//If the player is pressing the sprint key and isn't currently sneaking
	if (global.in[sprint] && !isSneaking) {
		//Start sprinting
		isSprinting = true;
		//Use the sprint modifier this step
		movementSpeed *= sprintMod;
	//The player is not sprinting.  Set isSprinting to false
	} else {
		isSprinting = false;
	}
	
	//If the player is pressing the sneak key and isn't currently sprinting
	if (global.in[sneak] && !isSprinting) {
		//Start sneaking
		isSneaking = true;
		//Use the sneak modifier this step
		movementSpeed *= sneakMod;
	//The player is not sneaking.  Set isSneaking to false
	} else {
		isSneaking = false;
	}
	
	//If the movement vector is zero, that means no movement inputs are detected.
	if (visZero(curDirVec)) {
		//Set damping to 15 so the player decelerates quickly to a stop
		phy_linear_damping = 25;
		
	//Inputs are detected
	} else {
		//Remove linear damping
		phy_linear_damping = 0;
		//Create a movement force by scaling the directional vector
		var moveForce = vscaleTo(dirForceMag, curDirVec);
		//Apply the movement force
		physics_apply_local_force(0, 0, moveForce[0], moveForce[1]);
		
		//Limit the magnitude of the velocity based on the current movement speed and the position of the joystick
		vlimitMag(vmag(curDirVec)*movementSpeed, vel);
		//Apply the newly limited velocity to the object
		phy_linear_velocity_x = vel[0];
		phy_linear_velocity_y = vel[1];
	}
	
	//Decriment the jump cooldown
	jumpTimer -= 1;
	//If the jump key was pressed this step and jumping is off of cooldown
	if (global.in[jump] == 1 && global.inPrev[jump] == 0 && jumpTimer <= 0) {
		//The player is now jumping
		isJumping = true;
		//Set the jump length based on a constant
		jumpTimer = floor(global.stepsInSecond/jumpLengthMod);
		//Set the jump speed
		var jumpSpeed = vsetMagTo(maxSpeed*jumpModifier, vel);
		if (isSprinting) { vscale(sprintMod, jumpSpeed); }
		if (isSneaking) { vscale(sneakMod, jumpSpeed); }
		//Apply a jump impulse based on current velocity
		physics_apply_local_impulse(0, 0, jumpSpeed[0], jumpSpeed[1]);
	}

//The player is currently jumping
} else {
	//If the player is holding jump, decriment the jump timer.
	//If the player has released the jump key, end the jump
	if (global.in[jump]) { jumpTimer -= 1; } else { jumpTimer = 0; }
	if (jumpTimer <= 0) {
		isJumping = false;
		jumpTimer = floor(global.stepsInSecond/jumpCooldownMod);
	}
}