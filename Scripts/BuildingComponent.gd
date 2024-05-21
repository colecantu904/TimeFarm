extends Node2D

var is_hovering : bool = false
@export var ui_node : Control

# is given a ui node to open when interacted with
# probably needs access to the inventory


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_hovering and Input.is_action_just_pressed("ui_accept"):
		ui_node.show()
		


func _on_area_2d_mouse_entered():
	is_hovering = true


func _on_area_2d_mouse_exited():
	is_hovering = false
