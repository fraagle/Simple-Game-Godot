extends CharacterBody2D


@export var speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0

func _physics_process(delta: float) -> void:
	
	# Apply gravity
	if not is_on_floor():
		print('gravity')
		velocity.y += gravity * delta  # Multiply by delta to make it time dependent not frame dep.
	
	# Horizontal movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta) # move character from vel.x towards 0, at speed

	
	
