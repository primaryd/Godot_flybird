extends Node


var create_timer:=Timer.new()
#水管实例
const PIPE_DOWN = preload("res://pipe/pipe_down.tscn")
const PIPE_UP = preload("res://pipe/pipe_up.tscn")

const  PIPE_UP_CREATE:=Vector2(1110,600) #pipe_up 的生成位置
const  PIPE_DOWN_CREATE:=Vector2(1110,0) #pipe_down 的生成位置


#角色的位置在屏幕中间的位置  （1024*600）（x坐标为512 y坐标为300） 水管生成的位置应该在玩家前面

func _ready() -> void:
	add_child(create_timer)
	create_timer.wait_time=2
	create_timer.timeout.connect(can_create)
	create_timer.start( )


func can_create()->void:
	print("create")
	var up_or_down:= randi()%10  #生成应该随机数来判断 生成的水管方向
	var pipe_scale:=randf_range(1,2.8)  #随机生成一个float数 指定为水管的长度
	#判断 up_or_down 是奇数还是偶数 来看生成向下的水管还是向上的水管
	if up_or_down %2 == 0:
		var pipe=PIPE_DOWN.instantiate()
		pipe.position=PIPE_DOWN_CREATE
		pipe.scale.y=pipe_scale 
		add_child(pipe)
	else:
		var pipe=PIPE_UP.instantiate()
		pipe.position=PIPE_UP_CREATE
		pipe.scale.y=pipe_scale 
		add_child(pipe)
