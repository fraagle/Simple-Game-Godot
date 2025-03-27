extends CharacterBody2D

var cloud = null
var cloud_chase = null

var speed = 40


func _physics_process(delta: float) -> void:
	if cloud_chase:
		position.x = move_toward(position.x, cloud.global_position.x, speed * delta)
		
	move_and_slide()


# Rain Area
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == 'RainZone':
		print('Flower In Rain')
		
		cloud = area.get_parent()
		cloud_chase = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	print('Flower Out of Rain')
	cloud = null
	cloud_chase = false

# Flower Pot 
