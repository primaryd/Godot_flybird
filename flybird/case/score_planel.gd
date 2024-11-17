extends PanelContainer
@onready var one: Label = $VBoxContainer/HBoxContainer/one
@onready var two: Label = $VBoxContainer/HBoxContainer2/two
@onready var three: Label = $VBoxContainer/HBoxContainer3/three



func _ready() -> void:
	visibility_changed.connect(func():
		get_tree().paused=visible
		)
	GolbaScript.open_score.connect(_open_score)



func _open_score() -> void:
	var data=ResourceLoader.load("user://scene_data.tres") as SceneData
	var score=data.score
	score.sort()
	print(score)
	print("\n")
	if score.size()>=1:
		print(score[-1])
		one.text="1. "+str(score[-1])
	
	if score.size()>=2:
		print(score[-2])
		two.text="2. "+str(score[-2])
	
	
	if score.size()>=3:
		print(score[-3])
		three.text="3. "+str(score[-3])
	




func _on_close_button_down() -> void:
	visible=false
