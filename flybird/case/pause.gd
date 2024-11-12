extends Control



func _ready() -> void:
	visibility_changed.connect(func():
		get_tree().paused=visible
		)


func _on_back_button_down() -> void:
	visible=false
	get_tree().change_scene_to_file("res://MainScene/main.tscn")
	GolbaScript.game_can_run=false
	GolbaScript.game_ready=true





func _on_continue_button_down() -> void:
	visible=false
	



func _on_restart_button_down() -> void:
	visible=false
	get_tree().change_scene_to_file("res://MainScene/main.tscn")
