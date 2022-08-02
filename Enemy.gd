extends Area2D

export (int) var speed = 150
var hp = 5
signal enemi_died



func _physics_process(delta):
	global_position.y  += speed * delta
	
func take_damage(damage):
	hp -= damage
	if hp <=0:
		queue_free()
		emit_signal("enemi_died")

func _on_Enemy_area_entered(area):
	if area.is_in_group("player"):
		area.take_damage(1)
		queue_free()



