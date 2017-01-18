/// @description Create a global pathing grid
global.pathGridRes = 32;
global.pathGridWidth = room_width / global.pathGridRes;
global.pathGridHeight = room_height / global.pathGridRes;
global.pathGrid = mp_grid_create(0, 0, global.pathGridWidth, global.pathGridHeight, global.pathGridRes, global.pathGridRes);