/// @description Create a global pathing grid
global.pathRes = 32;
global.pathGridWidth = room_width / global.pathRes;
global.pathGridHeight = room_height / global.pathRes;
global.pathGrid = pCreateGrid(global.pathGridWidth, global.pathGridHeight);
global.pathNodes = pCreateNodes(global.pathGridWidth, global.pathGridHeight);

global.pathOpen = ds_priority_create();
global.pathClosed = ds_list_create();