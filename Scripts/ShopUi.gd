extends Control
class_name Shop

@export var grid : GridContainer
var current_shop_items = []
var tiles : Array[TileMap]
var labels : Array[Label]

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	# These are jsut for testing, still need to fix the resource classes
	var new = Corn.new()
	var newer = GreenBean.new()
	
	current_shop_items.append(new)
	current_shop_items.append(newer)
	
	
	
	for child in grid.get_children():
		for node in child.get_children():
			if node.get_class() == "TileMap":
				tiles.append(node)
			else:
				labels.append(node)
	
	update_shop(current_shop_items)

# this can be called to update the shop items
func update_shop(items ):
	for i in range(items.size()):
		tiles[i].set_cell(0, Vector2i(0,0), 0, Vector2i(items[i].icon_x_atlas, items[i].icon_y_atlas))
		labels[i].text = str(items[i].resource_cost)


func _on_exit_button_pressed():
	hide()
