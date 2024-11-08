extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score: Label = $CanvasLayer/Score
@onready var bird: CharacterBody2D = $Bird




func _ready() -> void:
	animation_player.play("defalt")
	GolbaScript.game_over.connect(_game_over)
	GolbaScript.game_start.connect(_game_start)
	if GolbaScript.game_ready:
		animation_player.play("Game_ready_in")
	GolbaScript.record_score.connect(_record_score)



func _game_over()->void:
	GolbaScript.game_can_run=false
	animation_player.play("Game_over_in")

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




func _on_setting_button_down() -> void:
	#有bug未修复:再按下一次鼠标左键后，只要将指针移动到按钮上 按空格就能触发（不知道什么原因）
	print("setting")
	


func _on_restart_button_down() -> void:
	#重新载入游戏
	get_tree().change_scene_to_file("res://MainScene/main.tscn")
	GolbaScript.game_ready=false
	GolbaScript.game_can_run=true
	GolbaScript.score=0
	#animation_player.play("Game_over_out")
	
	
