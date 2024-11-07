extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("defalt")
	GolbaScript.game_over.connect(_game_over)
	GolbaScript.game_start.connect(_game_start)
	animation_player.play("Game_ready_in")


func _game_over()->void:
	animation_player.play("Game_over")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		GolbaScript.game_start.emit()

func _game_start()->void:
	if GolbaScript.game_ready :
		GolbaScript.game_ready=false
		GolbaScript.game_can_run=true
		animation_player.play("Game_ready_out")
