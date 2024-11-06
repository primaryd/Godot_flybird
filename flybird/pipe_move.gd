extends Node2D

@export var move_speed:=180


func _process(delta: float) -> void:
	if GolbaScript.game_can_run:
		self.position.x-=move_speed*delta
		if self.position.x<-100:
			GolbaScript.del_pipe.emit(self)




func _on_area_2d_body_entered(body: Node2D) -> void:
	GolbaScript.game_can_run=false
	GolbaScript.game_over.emit()
