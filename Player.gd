extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@export var speed: float = 100.0
@export var acceleration: float = 400.0
#@export var decceleration: float = 100.0
@export var friction: float = 500.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0

func _physics_process(delta: float) -> void:
	
	# Apply gravity
	if not is_on_floor():
		#print('gravity')
		velocity.y += gravity * delta  # Multiply by delta to make it time dependent not frame dep.
	
	# Horizontal movement
	var direction = Input.get_axis("left", "right")
	if direction:
		#velocity.x = direction * speed
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
		
		animated_sprite_2d.play("Running")
		animated_sprite_2d.flip_h = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta) # move character from vel.x towards 0, at speed
	
	# Animation:
	if velocity.x == 0:
		animated_sprite_2d.play('Idle')
		
	
	
		
	
	move_and_slide()
