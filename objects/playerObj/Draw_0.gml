///@description Update player sprite based on inputs

//Save the direction vector locally
var curDV = global.in[dirVec];

if (curDV[0] > 0 && curDV[1] > 0) {
	sprite_index = playerRDSpr;
} else if (curDV[0] > 0 && curDV[1] < 0) {
	sprite_index = playerURSpr;
} else if (curDV[0] < 0 && curDV[1] > 0) {
	sprite_index = playerDLSpr;
} else if (curDV[0] < 0 && curDV[1] < 0) {
	sprite_index = playerLUSpr;
} else if (curDV[0] > 0) {
	sprite_index = playerRSpr;
} else if (curDV[0] < 0) {
	sprite_index = playerLSpr;
} else if (curDV[1] > 0) {
	sprite_index = playerDSpr;
} else if (curDV[1] < 0) {
	sprite_index = playerUSpr;
} else {
	sprite_index = playerStoppedSpr;
}

/* 4 direction sprites
if (curDV[0] > 0) {
	sprite_index = playerRightSpr;
} else if (curDV[0] < 0) {
	sprite_index = playerLeftSpr;
} else if (curDV[1] > 0) {
	sprite_index = playerDownSpr;
} else if (curDV[1] < 0) {
	sprite_index = playerUpSpr;
} else {
	sprite_index = playerStoppedSpr;
}
*/
draw_self();