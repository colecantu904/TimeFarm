extends TileMap

func render_done():
	for i in range(5):
			for j in range(3):
				set_cell(0, Vector2i(i - 3, j - 1), 0, Vector2i(i, j+9))

func render_start():
	for i in range(5):
				for j in range(3):
					set_cell(0, Vector2i(i- 3, j- 1), 0, Vector2i(i+5, j+9))
	
func render_icon(resource : Source):
	add_layer(1)
	set_cell(1, Vector2i(2  - 3, - 1), 0, Vector2i(resource.icon_x_atlas, resource.icon_y_atlas))

func remove_icon():
	remove_layer(1)
