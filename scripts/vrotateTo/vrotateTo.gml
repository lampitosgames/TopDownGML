///@description Rotate a vector by a specific number of degrees
///@param deg
///@param vector

//Rotation matrix
//[ x1  x2 ] = [ cos(angle)  -sin(angle) ]
//[ y1  y2 ]   [ sin(angle)  cos(angle)  ]
var x1 = dcos(argument0);
var x2 = -1*dsin(argument0);
var y1 = dsin(argument0);
var y2 = dcos(argument0);
//Vector
var vx = argument1[0];
var vy = argument1[1];
//Rotate the vector
var rotated = [(x1*vx)+(x2*vy), (y1*vx)+(y2*vy)];
return rotated;
