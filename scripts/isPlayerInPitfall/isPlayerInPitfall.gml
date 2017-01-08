///@description Logic that checks if the player has fallen into a pitfall
if (place_meeting(phy_position_x, phy_position_y-40, pitfallObj) &&
	place_meeting(phy_position_x+40, phy_position_y, pitfallObj) &&
	place_meeting(phy_position_x, phy_position_y+40, pitfallObj) &&
	place_meeting(phy_position_x-40, phy_position_y, pitfallObj) &&
	place_meeting(phy_position_x-40, phy_position_y-40, pitfallObj) &&
	place_meeting(phy_position_x+40, phy_position_y-40, pitfallObj) &&
	place_meeting(phy_position_x+40, phy_position_y+40, pitfallObj) &&
	place_meeting(phy_position_x-40, phy_position_y+40, pitfallObj)) {
	return true;
} else {
	return false;
}