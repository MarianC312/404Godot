extends Node3D

@onready var timer = $Timer
@onready var tiles : Array = get_tree().get_nodes_in_group("ColoredTiles")
const maxTileT : int = 10
var tileTCounter : int = 0

func _ready() -> void:
	_swap_tile_color()

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	tileTCounter = 0
	_swap_tile_color()
	timer.start()

func _swap_tile_color() -> void:
	tiles.shuffle()
	for tile : Area3D in tiles:
		tile._change_tile_material((tileTCounter < maxTileT) if true else false)
		tileTCounter += 1
