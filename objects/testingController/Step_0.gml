/// @description Check for debug
if (global.in[debugToggle] == 1 && global.inPrev[debugToggle] == 0) {
	global.debug = (global.debug == true) ? false : true;
}