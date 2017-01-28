///@description Checks whether a value exists in the priority queue
///@param queue
///@param tempQueue
///@param value

var queue = argument1;
ds_priority_copy(queue, argument0);

while (!ds_priority_empty(queue)) {
	var val = ds_priority_delete_min(queue);
	if (val == argument2) {
		ds_priority_clear(queue);
		return true;
	}
}
ds_priority_clear(queue);
return false;