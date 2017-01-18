///@description Setup the player character

event_inherited();
//Add a movement module
movement = instance_create_depth(0, 0, 0, advancedMovementModule);
movement.char = id;
//All attributes start at 0.
attr.vitality = 5;
attr.endurance = 5;
//etc.

//How long (in seconds) before the sprint bonus can be applied to jumps
sprintWarmup = 0.5;
//Step counter for the warmup
sprintWarmupCounter = 0;
//Bounding box for the "feet" of the character
movementBoundingBox = [x-16, y, x+16, y+48];