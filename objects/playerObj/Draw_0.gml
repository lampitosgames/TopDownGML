///@description Update player sprite based on inputs

//Save the direction vector locally
var curDV = global.in[dirVec];

if (dir[0] > 0 && dir[1] > 0) {
	sprite_index = playerRDSpr;
} else if (dir[0] > 0 && dir[1] < 0) {
	sprite_index = playerURSpr;
} else if (dir[0] < 0 && dir[1] > 0) {
	sprite_index = playerDLSpr;
} else if (dir[0] < 0 && dir[1] < 0) {
	sprite_index = playerLUSpr;
} else if (dir[0] > 0) {
	sprite_index = playerRSpr;
} else if (dir[0] < 0) {
	sprite_index = playerLSpr;
} else if (dir[1] > 0) {
	sprite_index = playerDSpr;
} else if (dir[1] < 0) {
	sprite_index = playerUSpr;
} else {
	sprite_index = playerStoppedSpr;
}

/* 4 direction sprites
if (dir[0] > 0) {
	sprite_index = playerRightSpr;
} else if (dir[0] < 0) {
	sprite_index = playerLeftSpr;
} else if (dir[1] > 0) {
	sprite_index = playerDownSpr;
} else if (dir[1] < 0) {
	sprite_index = playerUpSpr;
} else {
	sprite_index = playerStoppedSpr;
}
*/
draw_self();