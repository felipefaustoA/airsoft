extends Node3D

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()
