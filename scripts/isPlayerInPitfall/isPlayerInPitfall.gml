///@description Logic that checks if the player has fallen into a pitfall
///@param playerBoundingBox

var bb = argument0;

//Check the player's inner hitbox to determine if the player has fallen
if (position_meeting(bb[0], bb[1], pitfallObj) &&
	position_meeting(bb[2], bb[3], pitfallObj) &&
	position_meeting(bb[0], bb[3], pitfallObj) && 
	position_meeting(bb[2], bb[1], pitfallObj)) {
	return true;
} else {
	return false;
}