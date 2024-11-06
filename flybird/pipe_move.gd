extends Node2D

@export var move_speed:=180

func _process(delta: float) -> void:
	self.position.x-=move_speed*delta
	print(position.x)
