///@description Project v1 onto v2
///@param v1
///@param v2

var v1 = argument0,
	v2 = argument1;

var factor = vdot(v2, v1) / (v2[0]*v2[0] + v2[1]*v2[1]);

return [factor*v2[0], factor*v2[1]];