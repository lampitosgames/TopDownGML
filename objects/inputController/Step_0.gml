///@description Detect inputs & calculate virtual inputs
//Set previous input state
global.inPrev = global.in;
//Get current input state
global.in = [];
global.in[up] = keyboard_check(global.kb[up]);
global.in[right] = keyboard_check(global.kb[right]);
global.in[down] = keyboard_check(global.kb[down]);
global.in[left] = keyboard_check(global.kb[left]);
global.in[jump] = keyboard_check(global.kb[jump]);
global.in[sprint] = keyboard_check(global.kb[sprint]);
global.in[sneak] = keyboard_check(global.kb[sneak]);
// TODO: Set up controllers/secondary keybinds as follows:
//global.in[action] = keyboard_check(global.kb[action]) || keyboard_check(global.kbGamepad[action]);

//==================================================================================================

//Set up the movement direction vector
var newDV = [0, 0];
//Grab the dvSwitch from the previous state
var newDVSwitch = global.inPrev[dvSwitch];

//If neither axis key is pressed, set dvSwitch to 0
if (!global.in[left] && !global.in[right]) {
	newDVSwitch[0] = 0;
}
if (!global.in[up] && !global.in[down]) {
	newDVSwitch[1] = 0;
}

//The up key is pressed
if (global.in[up]) {
	//If the down key is also pressed, use dvSwitch to see which was pressed first
	if (global.in[down]) {
		//If down was pressed before up, move up.
		if (newDVSwitch[1] > 0) {
			vadd(newDV, [0, -1]);
		}
	//Only up is pressed
	} else {
		//Add to the new DV
		vadd(newDV, [0, -1]);
		//Set the dvSwitch to up
		newDVSwitch[1] = -1;
	}
}

//The right key is pressed
if (global.in[right]) {
	//If the left key is also pressed, use dvSwitch to see which was pressed first
	if (global.in[left]) {
		//If left was pressed before right, move right.
		if (newDVSwitch[0] < 0) {
			vadd(newDV, [1, 0]);
		}
	//Only right is pressed
	} else {
		//Add to the new DV
		vadd(newDV, [1, 0]);
		//Set the dvSwitch to right
		newDVSwitch[0] = 1;
	}
}

//The down key is pressed
if (global.in[down]) {
	//If the up key is also pressed, use dvSwitch to see which was pressed first
	if (global.in[up]) {
		//If up was pressed before down, move down.
		if (newDVSwitch[1] < 0) {
			vadd(newDV, [0, 1]);
		}
	//Only down is pressed
	} else {
		//Add to the new DV
		vadd(newDV, [0, 1]);
		//Set the dvSwitch to down
		newDVSwitch[1] = 1;
	}
}

//The left key is pressed
if (global.in[left]) {
	//If the right key is also pressed, use dvSwitch to see which was pressed first
	if (global.in[right]) {
		//If right was pressed before left, move left.
		if (newDVSwitch[0] > 0) {
			vadd(newDV, [-1, 0]);
		}
	//Only left is pressed
	} else {
		//Add to the new DV
		vadd(newDV, [-1, 0]);
		//Set the dvSwitch to left
		newDVSwitch[0] = -1;
	}
}

//Normalize the new directional vector
vnorm(newDV);
//Set the new directional vector in the state (if it is not undefined)
global.in[dirVec] = (newDV == undefined) ? [0, 0] : newDV;
global.in[dvSwitch] = newDVSwitch;