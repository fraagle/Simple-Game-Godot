extends RayCast2D

var max_view_distance = 100
var target = null

#func _ready() -> void:
	#generate_raycast()
#
#func generate_raycast()-> void:
	#var ray := RayCast2D.new()
	##ray.cast_to = max_view_distance
	#add_child(ray)
	#ray.enabled = true
	#
#func _physics_process(delta: float) -> void:
	#for ray in get_children():
		#if ray.is_colliding() and get_collider() is CollisionObject2D:
			#target = get_collider()
			#break
