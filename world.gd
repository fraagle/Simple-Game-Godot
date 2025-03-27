extends Node2D

#@onready var collision_polygon_2d: CollisionPolygon2D = $StaticBody2D/CollisionPolygon2D
#@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D

@onready var flower_pot: Area2D = $FlowerPot
@onready var level_completed: ColorRect = $UI/LevelCompleted

@export var next_level: PackedScene

func _ready():
	#polygon_2d.polygon = collision_polygon_2d.polygon
		
	flower_pot.level_completed_signal.connect(show_level_completed)


func show_level_completed():
	level_completed.show()
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	get_tree().paused = false
	if next_level is PackedScene:
		get_tree().change_scene_to_packed(next_level)
	else:
		get_tree().quit()


func _on_player_cloud_reset() -> void:
	get_tree().reload_current_scene()
