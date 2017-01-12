///@description Override default character behavior. Detect if the jump key was pressed this step.  if it was, start jumping. Check an arc in front of the player to find a safe landing position.

//If the jump key was pressed this step and jumping is off of cooldown
if (global.in[jump] == 1 && global.inPrev[jump] == 0 && jumpTimer <= 0) {
	//Remove linear damping
	phy_linear_damping = 0;
	
	//Save the player position
	var pos = [phy_position_x, phy_position_y];
	
	//The player is now jumping
	isJumping = true;
	//Set the jump length based on a constant
	jumpTimer = floor(global.stepsInSecond/jumpLengthMod);
	//Set the jump velocity
	var jumpVel = vsetMagTo(maxSpeed*jumpModifier, dir);
	
	//If the player is sprinting and moving fast enough
	if (sprintWarmupCounter >= floor(global.stepsInSecond*sprintWarmup)) {
		//Jump farther.  This allows for "run ups"
		vscale(sprintMod, jumpVel);
	}
	//If the player is sneaking, make the jump very short
	if (isSneaking) { vscale(sneakMod, jumpVel); }
	
	//Get the jump velocity scaled by time.  This is the jump displacement
	var jumpDisplacement = vscaleTo(jumpTimer*global.dt, jumpVel);
	
	//Find a safe spot to land within <offset> degrees in either direction.
	var offset = 45;
	var safeRotation = 0;
	
	//Only check an arc for better landing positions if the jumpDisplacement rotated <offset> degrees would be off the edge of the platform
	var adjacent = vscaleTo(dcos(offset), jumpDisplacement);
	if (!place_empty(pos[0] + adjacent[0], pos[1] + adjacent[1])) {
		//Loop through increasing offsets
		//Starting with 0 in the center, iterate outwards to check the full arc for safe locations
		for (var i=0; i <= offset; i += 5) {
			//Rotate clockwise by i degrees
			var rotatePositive = vrotateTo(i, jumpDisplacement);
			//Check the rotated position after the jump to see if it is safe
			vadd(rotatePositive, pos);
			if (place_empty(rotatePositive[0], rotatePositive[1])) {
				//This jump is safe.  Save this rotation and break
				safeRotation = i;
				break;
			}
			//Rotate counter-clockwise by i degrees
			var rotateNegative = vrotateTo(-1*i, jumpDisplacement);
			//Check the rotated position after the jump to see if it is safe
			vadd(rotateNegative, pos);
			if (place_empty(rotateNegative[0], rotateNegative[1])) {
				//This jump is safe.  Save this rotation and break
				safeRotation = -1*i;
				break;
			}
		}
		//Rotate the jump speed to a safe location
		jumpVel = vrotateTo(safeRotation, jumpVel);
	}
	
	//Set the jump velocity
	phy_linear_velocity_x = jumpVel[0];
	phy_linear_velocity_y = jumpVel[1];
}