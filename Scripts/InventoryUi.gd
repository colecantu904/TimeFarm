extends Control
class_name Inventory

@export var grid : GridContainer
var inventory_list = []
var labels : Array[Label]
var tiles : Array[TileMap]

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in grid.get_children():
		for node in child.get_children():
			if node.get_class() == "Label":
				labels.append(node)
			elif node.get_class() == "TileMap":
				tiles.append(node)
	
	# initilize the empty inventory list
	for i in range(grid.get_child_count()):
		inventory_list.append([])
	
	# testing with putting a corn in the first slot
	#var new = Corn.new()
	#new.create()
	#inventory_list[0].append(new)

func display_inventory():
	print("Hi")

# when something needs something from you inventory, will return false if insufficient amount
func take_from_inventory(rescoure : Source) -> bool:
	print("found")
	return true

# when adding something to your inventory, returns false if there is not enough space
func add_to_inventory(resource : Source) -> bool:
	var empty : bool = false
	for i in range(inventory_list.size()):
		if inventory_list[i].size() > 0:
			print(inventory_list[i][0].source_name)
			if inventory_list[i][0].source_name == resource.source_name:
				inventory_list[i].append(resource)
				print(inventory_list[0])
				# update the ui
				labels[i].text = str(int(labels[i].text) + 1)
				tiles[i].set_cell(0, Vector2i(0,0), 0, Vector2i(resource.icon_x_atlas, resource.icon_y_atlas))
				return true
		else:
			# so that the next loop knows that there is a empty slot
			empty = true
			
	if empty:
		#find the first empty one
		for i in range(inventory_list.size()):
			if inventory_list[i].size() == 0:
				inventory_list[i].append(resource)
				labels[i].text = str(int(labels[i].text) + 1)
				tiles[i].set_cell(0, Vector2i(0,0), 0, Vector2i(resource.icon_x_atlas, resource.icon_y_atlas))
				return true
	# if there is no empty slots tell the player he cant pick it up somehow and return 
	else:
		return false
	return false

