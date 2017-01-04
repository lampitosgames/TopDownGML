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
	//Save this as the last safe location
	lastSafePos = [phy_position_x, phy_position_y];
	
	//Check for sprinting/sneaking
	//If the player is pressing the sprint key and isn't currently sneaking
	if (global.in[sprint] && !isSneaking) {
		isSprinting = true;
		movementSpeed *= sprintMod;
		//Increase the sprint timeer
		sprintWarmupCounter += 1;
		
	//The player is not sprinting.  Set isSprinting to false
	} else {
		//reset the sprint warmup counter
		sprintWarmupCounter = 0;
		isSprinting = false;
	}
	
	//If the player is pressing the sneak key and isn't currently sprinting
	if (global.in[sneak] && !isSprinting) {
		isSneaking = true;
		movementSpeed *= sneakMod;
		
	//The player is not sneaking.  Set isSneaking to false
	} else {
		isSneaking = false;
	}
	
	//If the movement vector is zero, that means no movement inputs are detected.
	if (visZero(curDirVec)) {
		//Set linear damping high enough to stop the player
		phy_linear_damping = 30;
		//reset the sprint warmup counter
		sprintWarmupCounter = 0;
		
	//Inputs are detected
	} else {
		//Remove linear damping
		phy_linear_damping = 0;
		//Get a normalized directional vector for sprite drawing
		dir = vnormTo(curDirVec);
		
		//Create a movement force by scaling the directional vector.  curDirVec could have a magnitude <1 if the player is using a gamepad.
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
		//Remove linear damping
		phy_linear_damping = 0;
		
		isJumping = true;
		//Set the jump length based on a constant
		jumpTimer = floor(global.stepsInSecond/jumpLengthMod);
		//Set the jump speed
		var jumpSpeed = vsetMagTo(maxSpeed*jumpModifier, dir);
		//If the player is sprinting and moving fast enough
		if (sprintWarmupCounter >= floor(global.stepsInSecond*sprintWarmup)) {
			//Jump farther.  This allows for "run ups"
			vscale(sprintMod, jumpSpeed);
		}
		//If the player is sneaking, make the jump very short
		if (isSneaking) { vscale(sneakMod, jumpSpeed); }
		//Apply a jump impulse
		physics_apply_local_impulse(0, 0, jumpSpeed[0], jumpSpeed[1]);
	}

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
	//If there is a safe location within a 32 pixel radius, jump to there
	var extendJump = vsetMagTo(48, vel);
	if (!falling && place_empty(phy_position_x+extendJump[0], phy_position_y+extendJump[1])) {
		//TODO: Do some detection in a radius and move to a safe space if possible
		phy_position_x += extendJump[0];
		phy_position_y += extendJump[1];
		phy_linear_velocity_x = 0;
		phy_linear_velocity_y = 0;
		isInPitfall = false;
	
	//No safe location
	} else {
		if (!falling) {
			falling = true;
			fallTimer = floor(global.stepsInSecond*1.5);
			vsetMag(16, extendJump);
			phy_position_x += extendJump[0];
			phy_position_y += extendJump[1];
			phy_linear_velocity_x = 0;
			phy_linear_velocity_y = 0;
			layer = layer_get_id("fallingLayer");
		}
	
		fallTimer -= 1;
		if (fallTimer < floor(global.stepsInSecond*1.5) - floor(global.stepsInSecond/3)) {
			physics_apply_local_force(0, 0, 0, 30);
		}
	
		if (falling == true && fallTimer <= 0) {
			isInPitfall = false;
			falling = false;
			fallTimer = 0;
			phy_position_x = lastSafePos[0];
			phy_position_y = lastSafePos[1];
			phy_linear_velocity_x = 0;
			phy_linear_velocity_y = 0;
			layer = layer_get_id("Instances");
		}
	}
}