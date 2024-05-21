class_name Source 
extends Node

# time to complete is the total time to complete the resource, not the time left
# rarirty is as follows: 1 common, 2 uncommon, 3 rare, 4 epic
# all of these values are for the basic corn crop, they will have to be altered 
# in new objects created in runtime to make other items

var time_to_complete : float
var icon_x_atlas : int
var icon_y_atlas : int
var resource_cost : int
var resource_rarity : int

func get_time():
	return time_to_complete
