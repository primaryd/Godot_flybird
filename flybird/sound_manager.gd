extends Node2D


@onready var sfx: Node = $SFX

func play_sfx(name:String)->void:
	var player:=sfx.get_node(name) as AudioStreamPlayer
	if not player:
		return
	player.play()


func get_volume()->float:
	var db:=AudioServer.get_bus_volume_db(0)
	return db_to_linear(db)
	

func set_volume(v:float)->void:
	var db :=linear_to_db(v)
	AudioServer.set_bus_volume_db(0,db)
