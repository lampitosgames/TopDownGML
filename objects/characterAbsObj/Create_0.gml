///@description Set Movement Constants
//Fix the character's rotation upon creation
phy_fixed_rotation = true;

//Modules
//Add a movement module (type is specified by children)
movement = undefined;
//Add an attribute module
attr = instance_create_depth(0, 0, 0, attributeModule);

/* Variables related to movement */
//The curDirVec holds directional data. Its magnitude also holds movement speed scaling data
curDirVec = [0, 0];
//Bounding box for the "feet" of the character
movementBoundingBox = [x-16, y, x+16, y+48];