/// @description Set delta time for entire game

//Detect if the player has paused the game
if (global.in[pause] && !global.inPrev[pause]) {
	global.paused = (global.paused == true) ? false : true;
}

//If the game is not paused
if (!global.paused) {
	//Get the delta_time in seconds (converted from miliseconds)
	global.dt = delta_time / 1000000;
//The game is paused
} else {
	//Set the delta time to zero
	global.dt = 0;
}
//Calculate the steps in a second
global.stepsInSecond = 60*room_speed*global.dt;
