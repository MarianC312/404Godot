extends Area3D

const tileMaterialT = preload("res://Materials/right_tile.tres")
const tileMaterialF = preload("res://Materials/wrong_tile.tres")
@onready var mesh : MeshInstance3D = $MeshInstance3D
var tileType : String = ""

func _ready() -> void:
	pass

func _change_tile_material(change: bool) -> void:
	if change == true:
		mesh.set_surface_override_material(0, tileMaterialT)
		tileType = "Green (OK)"
	else:
		mesh.set_surface_override_material(0, tileMaterialF)
		tileType = "Red (NOT)"

func _print_data() -> void:
	print(name + ": " + tileType)
