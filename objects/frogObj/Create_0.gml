/// @description Setup
event_inherited();
attr.healthLossOnFall = 100;
movement = instance_create_depth(0, 0, 0, basicMovementModule);
movement.char = id;
//Bounding box for the "feet" of the character
movementBoundingBox = [x-33, y-18, x+36, y+52];

aggroRadius = 500;

//Set physics to inactive initially
phy_active = false;