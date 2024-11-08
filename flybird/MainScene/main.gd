extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score: Label = $CanvasLayer/Score



func _ready() -> void:
	animation_player.play("defalt")
	GolbaScript.game_over.connect(_game_over)
	GolbaScript.game_start.connect(_game_start)
	animation_player.play("Game_ready_in")
	GolbaScript.record_score.connect(_record_score)



func _game_over()->void:
	GolbaScript.game_can_run=false
	animation_player.play("Game_over")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select") and not animation_player.is_playing():
		GolbaScript.game_start.emit()

func _game_start()->void:
	if GolbaScript.game_ready :
		GolbaScript.game_ready=false
		GolbaScript.game_can_run=true
		animation_player.play("Game_ready_out")

func _record_score()->void:
	GolbaScript.score+=1
	score.text="得分:"+str(GolbaScript.score)
