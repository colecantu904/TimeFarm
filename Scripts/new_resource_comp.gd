extends Node2D

@export var global_timer : Node
@export var tile_to_edit : TileMap
@export var area : Area2D
# in runtime, the source will be passed by the player
@export var resource : Source =Corn.new()
@export var is_plant : bool = true


var hovering_over : bool = false
var time_started : float

# make it where you just attach the tilemap to the component in the same node and just have it create teh icon over the thing

# Called when the node enters the scene tree for the first time.
func _ready():
	resource.create()

	tile_to_edit.render_start()
	tile_to_edit.render_icon(resource)
	
	# set the gloabl time started
	time_started = global_timer.timepassed
	
	# debugging
	#print(time_started)
	#print(resource.time_to_complete)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if resource:
		if  global_timer.timepassed - time_started > resource.time_to_complete:
			# render the tiles
			tile_to_edit.render_done()
			
			# see if the player clicks on them
			if hovering_over:
				# ui element for collection crops
				if Input.is_action_just_pressed("click"):
					time_started = global_timer.timepassed
					resource = null
					tile_to_edit.render_start()
					tile_to_edit.remove_icon()
					print("collected!")

# HANDLES MOUSE HOVERING
func _on_area_2d_mouse_entered():
	hovering_over = true

func _on_area_2d_mouse_exited():
	hovering_over = false
