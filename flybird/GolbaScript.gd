extends Node

signal del_pipe #水管清除信号
signal game_over #游戏结束信号
signal game_start #游戏开始信号
signal record_score #计分信号
signal open_score #打开计分面板信号

var now_score:Array

const  CONFIG_PATH :="user://config.ini"
const MAIN = preload("res://MainScene/main.tscn")


func _ready() -> void:
	load_config()
	




func save_config()->void:
	var config:=ConfigFile.new()
	config.set_value("audio","master",SoundManager.get_volume())
	config.save(CONFIG_PATH)

func load_config()->void:
	var config :=ConfigFile.new()
	config.load(CONFIG_PATH)
	SoundManager.set_volume(
	config.get_value("audio","master",0.5)
	)
	


var game_can_run:bool=false
var game_ready:bool=true
var score:int = 0
