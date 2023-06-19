extends TileMap


var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 120
var height = 120

@onready var player = get_parent().get_child(1)


func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	#altitude.frequency = 0.005
	
	


@warning_ignore("unused_parameter")
func _process(delta):
	generate(player.position)


@warning_ignore("shadowed_variable_base_class")
func generate(position):
	var tilePosition = local_to_map(position)
	
	for x in range(width):
		for y in range(height):
			
			var moist = moisture.get_noise_2d(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y) * 10
			var temp = temperature.get_noise_2d(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y) * 10
			var alt = altitude.get_noise_2d(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y) * 10
			
			if alt < 2:
				set_cell(0, Vector2i(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y), 1, Vector2(4, round((temp + 10) / 5)))
			#elif alt == 2:
				#set_cell(0, Vector2i(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y), 1, Vector2(1, 2))
			elif alt > 4:
				set_cell(0, Vector2i(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y), 1, Vector2(0, round((temp + 10) / 5)))
			else:
				set_cell(0, Vector2i(tilePosition.x - width/2 + x, tilePosition.y - height/2 + y), 1, Vector2(round((moist + 10) / 5), round((temp + 10) / 5)))

