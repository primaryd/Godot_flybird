extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score: Label = $CanvasLayer/Score
@onready var bird: CharacterBody2D = $Bird
@onready var pause: Control = $CanvasLayer/Pause
@onready var score_planel: PanelContainer = $CanvasLayer/ScorePlanel




func _ready() -> void:
	var data=ResourceLoader.load("user://scene_data.tres") as SceneData
	GolbaScript.now_score=data.score
	print(GolbaScript.now_score)
	SoundManager.play_sfx("BackGroundMusic")
	animation_player.play("defalt")
	GolbaScript.game_over.connect(_game_over)
	GolbaScript.game_start.connect(_game_start)
	if GolbaScript.game_ready:
		animation_player.play("Game_ready_in")
	GolbaScript.record_score.connect(_record_score)



func _game_over()->void:
	var data =SceneData.new()
	SoundManager.play_sfx("Hit")
	GolbaScript.game_can_run=false
	animation_player.play("Game_over_in")
	GolbaScript.now_score.append(GolbaScript.score)
	data.score=GolbaScript.now_score
	ResourceSaver.save(data,"user://scene_data.tres")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select") and not animation_player.is_playing():
		GolbaScript.game_start.emit()

func _game_start()->void:
	if GolbaScript.game_ready :
		GolbaScript.game_ready=false
		GolbaScript.game_can_run=true
		animation_player.play("Game_ready_out")

func _record_score()->void:
	SoundManager.play_sfx("Get")
	GolbaScript.score+=1
	score.text="得分:"+str(GolbaScript.score)






func _on_restart_button_down() -> void:
	#重新载入游戏
	get_tree().change_scene_to_file("res://MainScene/main.tscn")
	GolbaScript.game_ready=false
	GolbaScript.game_can_run=true
	GolbaScript.score=0
	#animation_player.play("Game_over_out")
	
	

	


func _on_back_button_down() -> void:
	get_tree().change_scene_to_file("res://MainScene/main.tscn")
	GolbaScript.game_ready=true
	GolbaScript.game_can_run=false
	GolbaScript.score=0





func _on_rank_button_down() -> void:
	if not animation_player.is_playing():
		score_planel.visible=true
		GolbaScript.open_score.emit()


func _on_setting_pressed() -> void:
	if not animation_player.is_playing():
		pause.visible=true
