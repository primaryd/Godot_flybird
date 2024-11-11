extends CharacterBody2D

var  gravity := ProjectSettings.get("physics/2d/default_gravity") as float
@export var fly_force:float  ##向上飞行力度

#.....................................
var screen_size 

func _ready() -> void:
	screen_size = get_viewport_rect().size  #获取窗口大小
	self.position=Vector2(screen_size.x/2,screen_size.y/2) #将bird置于屏幕正中央
	$AnimatedSprite2D.play("default") 


func _physics_process(delta: float) -> void:
	if GolbaScript.game_can_run:
		if position.y<-26 or position.y>626:
			if GolbaScript.game_can_run == true:
				GolbaScript.game_over.emit()
		
		velocity.y+=gravity*delta
		if Input.is_action_just_pressed("ui_select"):
			SoundManager.play_sfx("Fly")
			velocity.y = fly_force
		move_and_slide()
