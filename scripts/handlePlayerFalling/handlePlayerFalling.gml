///@description Handle the case where a player has fallen into a pitfall.  If a surface is nearby, teleport and end the jump there.  Otherwise, kill the player and teleport them to the last safe location
///@param vel

var vel = argument0;
//If the player is not falling
if (!falling) {
	//Set them to be falling and start the falling animation
	falling = true;
	fallTimer = floor(global.stepsInSecond*1.5);
	phy_linear_velocity_x = 0;
	phy_linear_velocity_y = 0;
	layer = layer_get_id("fallingLayer");
	
	//Move the player 16 pixels in the direction they were moving.  This is an attempt to remove sprite clipping between the player and the floor
	var extendJump = vsetMagTo(16, vel);
	phy_position_x += extendJump[0];
	phy_position_y += extendJump[1];
}

//Decriment the fall timer (how long the player falls before being teleported back to a safe location)
fallTimer -= 1;
//Only apply gravity after 0.33 seconds have passed.  This freezes the character in the air for a split second
if (fallTimer < floor(global.stepsInSecond*1.1666)) {
	physics_apply_local_force(0, 0, 0, 30);
}

//If the fall is over, reset the player to the last safe location
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