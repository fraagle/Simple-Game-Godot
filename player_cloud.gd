extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 400.0
@export var air_friction: float = 500.0

func _physics_process(delta: float) -> void:
	
	# Horizontal movement
	var direction = Input.get_axis("left", "right")
	if direction:
		#velocity.x = direction * speed
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)

	else:
		velocity.x = move_toward(velocity.x, 0, air_friction * delta) # move character from vel.x towards 0, at speed
	
	move_and_slide()
	
	
	
