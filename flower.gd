extends CharacterBody2D

var cloud = null
var cloud_chase = null

@export var speed = 60
@export var gravity = 900
@export var jump_force = 300





func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		#print('gravity')
		velocity.y += gravity * delta  # Multiply by delta to make it time dependent not frame dep.
	
	
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


func _on_player_cloud_thunder() -> void:
	if cloud_chase:
		velocity.y -= jump_force
