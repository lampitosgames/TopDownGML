/// @description Setup initial game logic

//Run the macros script
setupMacros();

//Create other controllers
instance_create_layer(0, 0, "controllers", timingController);
instance_create_layer(0, 0, "controllers", testingController);
instance_create_layer(0, 0, "controllers", inputController);
instance_create_layer(0, 0, "controllers", pathfindingController);
