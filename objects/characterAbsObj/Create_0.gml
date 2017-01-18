///@description Set Movement Constants
//Fix the character's rotation upon creation
phy_fixed_rotation = true;

//Modules
//Add a movement module (type is specified by children)
movement = undefined;
//Add an attribute module
attr = instance_create_depth(0, 0, 0, attributeModule);
attr.maxHealth = 100;
attr.curHealth = 100;

/* Variables related to movement */
//The curDirVec holds directional data. Its magnitude also holds movement speed scaling data
curDirVec = [0, 0];