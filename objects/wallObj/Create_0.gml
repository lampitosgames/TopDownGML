/// @description On creation, add self to pathing grid

//Collider's origin is bottom-right for some reason
//TODO: When you create a new room, fix the collider
var x1 = min(room_width, x-sprite_width-(global.pathGridRes / 2));
var y1 = min(room_height, y-sprite_height-(global.pathGridRes / 2));
var x2 = max(0, x+(global.pathGridRes / 2));
var y2 = max(0, y+(global.pathGridRes / 2));

mp_grid_add_rectangle(global.pathGrid, x1, y1, x2, y2);
