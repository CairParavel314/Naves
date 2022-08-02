extends Node2D

var spawn_position = null

signal add_score

var Enemy = preload("res://Enemy.tscn")

func _ready():
	randomize()
	spawn_position = $SpawnPosition.get_children()
	
func spawn_enemy():
	var index = randi() % spawn_position.size()
	var enemy = Enemy.instance()
	enemy.global_position = spawn_position[index].global_position
	enemy.connect("enemi_died",self, "enemi_died")
	add_child(enemy)


func _on_SpawnTimer_timeout():
	spawn_enemy()
	
func enemi_died():
	emit_signal("add_score")
