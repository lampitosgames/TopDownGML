/// @description Set the correct sprite

if (movement.dir[0] >= 0) {
	sprite_index = frogRSpr;
} else {
	sprite_index = frogLSpr;
}

draw_self();