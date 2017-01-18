/// @description Blop

if (attr.curHealth <= 0) {
	//destroy all modules and self
	instance_destroy(movement);
	instance_destroy(attr);
	instance_destroy(id);
}