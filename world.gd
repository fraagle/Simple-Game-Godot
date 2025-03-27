extends Node2D

#@onready var collision_polygon_2d: CollisionPolygon2D = $StaticBody2D/CollisionPolygon2D
#@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D

@onready var flower_pot: Area2D = $FlowerPot
@onready var level_completed: ColorRect = $UI/LevelCompleted

@export var next_level: PackedScene

@onready var shader_mat: ShaderMaterial = $UI/DissolveRect.material
@onready var fade_out_mat: ShaderMaterial = $UI/FadeOutRect.material


var transition_speed = 0.5
var timer = 0.0
var animating = false

func _ready():
	#polygon_2d.polygon = collision_polygon_2d.polygon
	flower_pot.level_completed_signal.connect(show_level_completed)
	
	reverse_transition()
	

func _process(delta: float) -> void:
	pass
	#scene_transition(delta)


func show_level_completed():
	#level_completed.show()
	
	#get_tree().paused = true
	
	#await get_tree().create_timer(2.0).timeout
	
	run_transition()
	
	#get_tree().paused = false
	
	#get_tree().paused = false
	if next_level is PackedScene:
		get_tree().change_scene_to_packed(next_level)
		reverse_transition()
	
	#reverse_transition()
	
	

func _on_player_cloud_reset() -> void:
	get_tree().reload_current_scene()
	
	
#func scene_transition(delta):
	#if animating:
		##print('running transition')
		#timer += delta
		#var progress = clamp(timer / transition_speed, 0, 1)
		#shader_mat.set_shader_parameter("progress", progress)
		#if progress >= 1.0:
			#animating = false
		#
#
#func start_transition():
	#timer = 0.0
	#animating = true
	
func run_transition():
	var tween = get_tree().create_tween()
	tween.tween_property(shader_mat, "shader_parameter/progress", 1.0, 2.0)
	await tween.finished
	
func reverse_transition():
	var reverse_tween = create_tween()
	reverse_tween.tween_property(fade_out_mat, "shader_parameter/progress", 1.0, 2.0)
	await reverse_tween.finished
