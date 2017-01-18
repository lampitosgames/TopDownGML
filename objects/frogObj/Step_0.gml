/// @description Insert description here

//If the player is within an aggro radius
var playerPos = [0, 0];
with (playerObj) {
	playerPos[0] = x;
	playerPos[1] = y;
}

var pos = [x, y];

var directionalVector = vsubTo(playerPos, pos);

if (vmag(directionalVector) <= aggroRadius) {
	phy_active = true;
	curDirVec = vnormTo(directionalVector);
} else {
	phy_active = false;
}

//Bounding box for the "feet" of the character
movementBoundingBox = [x-33, y-18, x+36, y+52];