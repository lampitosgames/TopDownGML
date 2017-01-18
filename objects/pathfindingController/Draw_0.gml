/// @description Debug drawing
if (global.debug == true) {
	for (var h=0; h<global.pathGridHeight; h++) {
		for (var w=0; w<global.pathGridWidth; w++) {
			if (mp_grid_get_cell(global.pathGrid, w, h) == -1) {
				draw_rectangle_color(w*global.pathGridRes, h*global.pathGridRes, (w+1)*global.pathGridRes-1, (h+1)*global.pathGridRes-1, c_red, c_red, c_red, c_red, true);
			}
		}
	}
}