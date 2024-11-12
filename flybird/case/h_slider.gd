extends HSlider


func _ready() -> void:
	value=SoundManager.get_volume()
	
	value_changed.connect(func(v:float):
		SoundManager.set_volume(v)
		GolbaScript.save_config()
		)
		
	SoundManager.play_sfx("BackGroundMusic")
