extends Area2D
var speed = 1000
var power = 1

func _physics_process(delta):
	global_position.y += -speed * delta

func _on_Playerlaser_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(power)
		print(power)
		queue_free()


