extends Area2D

signal level_completed_signal

func _on_area_entered(area: Area2D) -> void:
	if area.name == 'FlowerArea':
		print('flower potted!')
		
		level_completed_signal.emit()
