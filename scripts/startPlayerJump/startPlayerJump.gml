///@description Detect if the jump key was pressed this step.  if it was, start jumping
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