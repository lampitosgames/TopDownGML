///@description Modifies and returns a new value for movement speed if the player is sprinting/sneaking

//If the player is pressing the sprint key and isn't currently sneaking
if (global.in[sprint] && !isSneaking) {
	isSprinting = true;
	vscale(sprintMod, curDirVec);
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
	vscale(sneakMod, curDirVec);
		
//The player is not sneaking.  Set isSneaking to false
} else {
	isSneaking = false;
}