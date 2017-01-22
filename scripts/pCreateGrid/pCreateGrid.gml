///@description create a path grid
///@param width
///@param height

var pathGrid = ds_grid_create(argument0, argument1);
ds_grid_set_region(pathGrid, 0, 0, argument0-1, argument1-1, 0);
return pathGrid;