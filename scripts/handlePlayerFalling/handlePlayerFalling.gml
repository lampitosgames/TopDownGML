///@description Handle the case where a player has fallen into a pitfall.  If a surface is nearby, teleport and end the jump there.  Otherwise, kill the player and teleport them to the last safe location
///@param vel

var vel = argument0;

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
	//TODO: Clean up this code
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