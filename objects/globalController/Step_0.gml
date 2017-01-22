/// @description Set the physics speed based on delta time
physics_world_update_speed(60*room_speed*global.dt);

//If debug is on, set the controller layer to visible
if (global.debug) {
	layer_set_visible("controllers", true);
	layer_set_visible("pitfallColliders", true);
	layer_set_visible("wallColliders", true);
} else if (layer_get_visible("controllers") || layer_get_visible("pitfallColliders") || layer_get_visible("wallColliders")) {
	layer_set_visible("controllers", false);
	layer_set_visible("pitfallColliders", false);
	layer_set_visible("wallColliders", false);
}