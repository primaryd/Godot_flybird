extends Node2D


@onready var sfx: Node = $SFX

func play_sfx(name:String)->void:
	var player:=sfx.get_node(name) as AudioStreamPlayer
	if not player:
		return
	player.play()
