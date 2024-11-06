extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("defalt")
	GolbaScript.game_over.connect(_game_over)


func _game_over()->void:
	animation_player.play("Game_over")
