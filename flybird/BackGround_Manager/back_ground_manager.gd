extends Node

const  SPEED=120  #背景图片移动速度
const  BORDER = 288 
var image_list

#获取子节点，也就是背景图片
func  _ready() -> void:
	image_list=get_children()


func _physics_process(delta: float) -> void:
	if GolbaScript.game_can_run:
		for image in image_list:  
			image.offset.x-=SPEED*delta
			if image.offset.x<=-BORDER:
				image.offset.x=3*BORDER
