/// @description Setup input variables
//Set up keybinds
global.kb = [];
global.kb[up] = ord("W");
global.kb[right] = ord("D");
global.kb[down] = ord("S");
global.kb[left] = ord("A");
global.kb[jump] = vk_space;
global.kb[sprint] = vk_lshift;
global.kb[sneak] = vk_lcontrol;
global.kb[debugToggle] = vk_f9;

//Initialize previous input state
global.inPrev = [];
//Initialize input state
global.in = [];
//Set keybound input states
global.in[up] = keyboard_check(global.kb[up]);
global.in[right] = keyboard_check(global.kb[right]);
global.in[down] = keyboard_check(global.kb[down]);
global.in[left] = keyboard_check(global.kb[left]);
global.in[jump] = keyboard_check(global.kb[jump]);
global.in[sprint] = keyboard_check(global.kb[sprint]);
global.in[sneak] = keyboard_check(global.kb[sneak]);
global.in[debugToggle] = keyboard_check(global.kb[debugToggle]);

//Set up non-keybound input states
global.in[dirVec] = [0, 0];
//dvSwitch is used for directional reversing.  If the player is moving right and they press the left key, they should switch to moving left.
//If both keys on an axis are depressed, this state variable stores which was pressed first.
global.in[dvSwitch] = [0, 0];