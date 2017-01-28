///@description Detect line of sight between two nodes
///@param node1
///@param node2

//Line of sight pseudocode found in http://idm-lab.org/bib/abstracts/papers/jair10b.pdf
var node1 = argument0;
var node2 = argument1;
//Get initial position of node 1
var x0 = node1[? "x"];
var y0 = node1[? "y"];
//Get initial position of node 2
var x1 = node2[? "x"];
var y1 = node2[? "y"];
//Get the delta between the points
var dy = y1 - y0;
var dx = x1 - x0;
//f-value
var f = 0;

//Increment values
var sx = 1;
var sy = 1;

//A work-around way for setting dx = abs(dx). Here we check the sign to make sure iteration happens in the proper direction
if (dy < 0) {
	dy *= -1;
	sy = -1;
} else {
	sy = 1;
}
if (dx < 0) {
	dx *= -1;
	sx = -1;
} else {
	sx = 1;
}

if (dx >= dy) {
	while (x0 != x1) {
		//F represents the slope. In this instance, dx > dy, so we only increment y once X has changed enough.
		f += dy;
		if (f >= dx) {
			//Check for collision at the point
			if (!pGridCellEmptyCoords(x0 + ((sx-1)/2), y0 + ((sy-1)/2))) {
				return false;
			}
			//Increment y
			y0 += sy;
			//Reset f back down below its threshhold
			f -= dx
		}
		//If the position wasn't checked in the above if statement, check it
		if (f != 0 && !pGridCellEmptyCoords(x0 + ((sx-1)/2), y0 + ((sy-1)/2))) {
			return false;
		}
		//This handles the case of straight lines where f will always be zero.
		if (dy == 0 && !pGridCellEmptyCoords(x0 + ((sx-1)/2), y0) && !pGridCellEmptyCoords(x0 + ((sx-1)/2), y0 - 1)) {
			return false;
		}
		//Increment x
		x0 += sx;
	}
} else {
	//Same logic for when dx > dy except flipped
	while (y0 != y1) {
		f += dx;
		if (f >= dy) {
			if (!pGridCellEmptyCoords(x0 + ((sx-1)/2), y0 + ((sy-1)/2))) {
				return false;
			}
			x0 += sx;
			f -= dy;
		}
		if (f != 0 && !pGridCellEmptyCoords(x0 + ((sx-1)/2), y0 + ((sy-1)/2))) {
			return false;
		}
		if (dx == 0 && !pGridCellEmptyCoords(x0, y0 + ((sy-1)/2)) && !pGridCellEmptyCoords(x0 - 1, y0 + ((sy-1)/2))) {
			return false;
		}
		y0 += sy;
	}
}
return true;