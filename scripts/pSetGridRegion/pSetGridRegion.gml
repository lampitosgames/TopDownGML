///@description Takes real pixel bounds of a rectangle and sets the representative cells to the specefied value
///@param x1
///@param y1
///@param x2
///@param y2
///@param val

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var val = argument4;

var x1index = floor(x1/global.pathRes);
var y1index = floor(y1/global.pathRes);
var x2index = ceil(x2/global.pathRes);
var y2index = ceil(y2/global.pathRes);

ds_grid_set_region(global.pathGrid, x1index, y1index, x2index, y2index, val);
