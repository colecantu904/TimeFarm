extends Node2D

@export var global_timer : Node
@export var tile_to_edit : TileMap
@export var area : Area2D
# in runtime, the source will be passed by the player
@export var resource : Source =Corn.new()
@export var is_plant : bool = true
@export var anim : AnimatedSprite2D
@export var icon : TileMap
var hovering_over : bool = false
var time_started : float

# make it where you just attach the tilemap to the component in the same node and just have it create teh icon over the thing

# Called when the node enters the scene tree for the first time.
func _ready():
	# sets the resources values
	resource.create()

	
	tile_to_edit.add_layer(1)
	tile_to_edit.set_cell(1, Vector2i(-2,-1), 0, Vector2i(resource.icon_x_atlas, resource.icon_y_atlas))
	
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
			anim.play("grown")
			
			# see if the player clicks on them
			if hovering_over:
				# ui element for collection crops
				if Input.is_action_just_pressed("click"):
					time_started = global_timer.timepassed
					tile_to_edit.remove_layer(1)
					resource = null
					anim.play("empty")
					print("collected!")

# HANDLES MOUSE HOVERING
func _on_area_2d_mouse_entered():
	hovering_over = true

func _on_area_2d_mouse_exited():
	hovering_over = false
