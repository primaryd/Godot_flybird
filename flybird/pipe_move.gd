extends Node2D

@export var move_speed:=180


func _process(delta: float) -> void:
	self.position.x-=move_speed*delta
	if self.position.x<-100:
		GolbaScript.del_pipe.emit(self)
