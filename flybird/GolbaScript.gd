extends Node

signal del_pipe #水管清除信号
signal game_over #游戏结束信号
signal game_start #游戏开始信号
signal record_score #计分信号

var game_can_run:bool=false
var game_ready:bool=true
var score:int = 0
