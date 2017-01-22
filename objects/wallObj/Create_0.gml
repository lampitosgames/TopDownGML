/// @description On creation, add self to pathing grid

//Collider's origin is bottom-right for some reason
//TODO: When you create a new room, fix the collider
var x1 = min(room_width, x-sprite_width-(global.pathRes / 2));
var y1 = min(room_height, y-sprite_height-(global.pathRes / 2));
var x2 = max(0, x+(global.pathRes / 2));
var y2 = max(0, y+(global.pathRes / 2));

pSetGridRegion(x1, y1, x2, y2, 1);
