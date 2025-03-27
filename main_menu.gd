extends ColorRect


@export var first_level: PackedScene

func _on_start_button_pressed() -> void:
	
	get_tree().change_scene_to_packed(first_level)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
