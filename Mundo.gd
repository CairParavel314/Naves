extends Node2D

var laser = preload("res://Playerlaser.tscn")

var hp = 3
var score = 0

func _on_Player_spawn_laser(location):
	var l = laser.instance()
	l.global_position = location
	add_child(l)
	
	
func score():
	score += 10
	$Score.text = "SCORE: " + str(score)


func _on_Player_quitarvida():
	hp -= 1
	$HP.text = "HP: " + str(hp)
