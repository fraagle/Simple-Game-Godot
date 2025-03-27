extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 400.0
@export var air_friction: float = 500.0

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var rain_particles_gpu_2d: GPUParticles2D = $RainParticlesGPU2D


#@onready var rain_zone: Area2D = $RainZone
@onready var collision_shape_2d: CollisionShape2D = $RainZone/CollisionShape2D

#var ray_cast_2d.target_position.y = 110.0

func _physics_process(delta: float) -> void:

	ray_cast_2d.force_raycast_update()
	
	if ray_cast_2d.is_colliding():
		var hit_pos = ray_cast_2d.get_collision_point()
		var distance = hit_pos.y - global_position.y
		
		ray_cast_2d.target_position.y = distance
		
		set_rain_length(distance)
		
		#print()
		collision_shape_2d.position.y =  distance - collision_shape_2d.shape.size.y/2
		
		
		
	else:  # reset ray!
		ray_cast_2d.target_position.y = 200.0
	
	# Horizontal movement
	var direction = Input.get_axis("left", "right")
	if direction:
		#velocity.x = direction * speed
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)

	else:
		velocity.x = move_toward(velocity.x, 0, air_friction * delta) # move character from vel.x towards 0, at speed
	
	move_and_slide()
	
	#
#func update_rain_visual(length):
	#rain_particles_gpu_2d.scale.y = length / 100.0

func set_rain_length(length):
	var material = rain_particles_gpu_2d.process_material
	if material is ParticleProcessMaterial:
		var gravity = material.gravity
		var speed = abs(gravity.y)
		
		if speed > 0:
			var lifetime = length / speed 
			rain_particles_gpu_2d.lifetime = lifetime * 5
			print(rain_particles_gpu_2d.lifetime)
			
			
			
			
			#material.lifetime = int(lifetime)
			#print(lifetime)
