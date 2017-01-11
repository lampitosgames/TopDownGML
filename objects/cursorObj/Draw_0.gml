/// @description Draw self and draw another sprite scaled down closer to the player

draw_self();

var playerPos = [0, 0];
with (playerObj) {
	playerPos = [x, y];
}

//Get vector towards player
var toPlayer =  [playerPos[0] - mouse_x, playerPos[1] - mouse_y];
vsetMag(64, toPlayer);

var secondaryPos = vaddTo(toPlayer, [mouse_x, mouse_y]);

draw_sprite(subCursorSpr, 1, secondaryPos[0], secondaryPos[1]);