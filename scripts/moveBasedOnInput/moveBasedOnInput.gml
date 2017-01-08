///@description Move the player based on inputs
///@param movementSpeed
///@param vel

var movementSpeed = argument0;
var vel = argument1;
var curDirVec = global.in[dirVec];

//If the movement vector is zero, that means no movement inputs are detected.
if (visZero(curDirVec)) {
	//Set linear damping high enough to stop the player
	phy_linear_damping = 30;
	//reset the sprint warmup counter
	sprintWarmupCounter = 0;
		
//Inputs are detected
} else {
	//Remove linear damping
	phy_linear_damping = 0;
	//Get a normalized directional vector for sprite drawing
	dir = vnormTo(curDirVec);
		
	//Create a movement force by scaling the directional vector.  curDirVec could have a magnitude <1 if the player is using a gamepad.
	var moveForce = vscaleTo(dirForceMag, curDirVec);
	//Apply the movement force
	physics_apply_local_force(0, 0, moveForce[0], moveForce[1]);
		
	//Limit the magnitude of the velocity based on the current movement speed and the position of the joystick
	vlimitMag(vmag(curDirVec)*movementSpeed, vel);
	//Apply the newly limited velocity to the object
	phy_linear_velocity_x = vel[0];
	phy_linear_velocity_y = vel[1];
}