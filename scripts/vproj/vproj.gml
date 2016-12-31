///@description Project v1 onto v2.  Changes v1 to the projected vector
///@param v1
///@param v2

var v1 = argument0,
	v2 = argument1;

var factor = vdot(v2, v1) / (v2[0]*v2[0] + v2[1]*v2[1]);

argument0[@ 0] = factor*v2[0];
argument0[@ 1] = factor*v2[1];