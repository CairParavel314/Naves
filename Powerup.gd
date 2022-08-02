extends Area2D


func _on_Powerup_area_entered(area):
	if area.is_in_group("player"):
		area.powerup()
		area.powerl()
		queue_free()
