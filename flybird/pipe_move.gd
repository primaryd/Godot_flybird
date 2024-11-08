extends Node2D

@export var move_speed:=180

var can_record_socre:bool=true

func _process(delta: float) -> void:
	if GolbaScript.game_can_run:
		self.position.x-=move_speed*delta
		if position.x<512 and can_record_socre:
			can_record_socre=false
			GolbaScript.record_score.emit()
		if self.position.x<-100:
			GolbaScript.del_pipe.emit(self)



func _on_area_2d_body_entered(body: Node2D) -> void:
	GolbaScript.game_over.emit()
