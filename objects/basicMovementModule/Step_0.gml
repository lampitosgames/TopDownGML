///@description Move character
//Store the velocity and position
var vel = [char.phy_linear_velocity_x, char.phy_linear_velocity_y];
var pos = [char.phy_position_x, char.phy_position_y];

//Check if character is in a pitfall
if (position_meeting(char.movementBoundingBox[0], char.movementBoundingBox[1], pitfallObj) &&
	position_meeting(char.movementBoundingBox[2], char.movementBoundingBox[3], pitfallObj) &&
	position_meeting(char.movementBoundingBox[0], char.movementBoundingBox[3], pitfallObj) && 
	position_meeting(char.movementBoundingBox[2], char.movementBoundingBox[1], pitfallObj)) {
	isInPitfall = true;
} else {
	isInPitfall = false;
}

//If the character is not jumping or falling
if (!isInPitfall && !falling && !global.paused) {
	//Save this as the last safe location.  Subtract 1/10 of the velocity from the location to make sure the character can land safely
	var scaledNegVel = vscaleTo(-0.1, vel);
	lastSafePos = vaddTo(pos, scaledNegVel);
	
	//If the movement vector is zero, the character is not moving
	if (visZero(char.curDirVec)) {
		//Set linear damping high enough to stop the character
		char.phy_linear_damping = 30;
	//The character is moving
	} else {
		//Remove linear damping
		char.phy_linear_damping = 0;
		//Get a normalized directional vector.  This holds character direction once the character stops moving
		dir = vnormTo(char.curDirVec);
		
		//Create a movement force by scaling the directional vector
		var newVel = vscaleTo(maxSpeed, dir);
		
		//Apply the newly limited velocity to the object
		char.phy_linear_velocity_x = newVel[0];
		char.phy_linear_velocity_y = newVel[1];
	}

//The character is falling
} else if (!global.paused) {
	//This is the first step the character is falling
	if (!falling) {
		//Set them to be falling and start the falling animation
		falling = true;
		fallTimer = floor(global.stepsInSecond*1.5);
		char.phy_linear_velocity_x = 0;
		char.phy_linear_velocity_y = 0;
		char.layer = layer_get_id("fallingLayer");
	
		//Move the character 16 pixels in the direction they were moving.  This is an attempt to remove sprite clipping between the character and the floor
		var extendJump = vsetMagTo(16, vel);
		char.phy_position_x += extendJump[0];
		char.phy_position_y += extendJump[1];
	}

	//Decriment the fall timer (how long the character falls before being teleported back to a safe location)
	fallTimer -= 1;
	//Only apply gravity after 0.33 seconds have passed.  This freezes the character in the air for a split second
	if (fallTimer < floor(global.stepsInSecond*1.1666)) {
		with (char) {
			physics_apply_local_force(0, 0, 0, 30);
		}
	}

	//If the fall is over, reset the character to the last safe location
	if (falling == true && fallTimer <= 0) {
		isInPitfall = false;
		falling = false;
		fallTimer = 0;
		//subtract from player health
		char.attr.curHealth -= char.attr.healthLossOnFall;
		char.phy_position_x = lastSafePos[0];
		char.phy_position_y = lastSafePos[1];
		char.phy_linear_velocity_x = 0;
		char.phy_linear_velocity_y = 0;
		char.layer = layer_get_id("Instances");
	}
}