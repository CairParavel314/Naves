extends Area2D
class_name Player
onready var muzzle = $Laser
signal quitarvida

signal spawn_laser(location)
var shoot =1
var speed = 450
var hp = 3

var input_vector = Vector2.ZERO

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda")
	input_vector.y = Input.get_action_strength("abajo") - Input.get_action_strength("arriba")
	global_position += input_vector * speed * delta
	
	if Input.is_action_just_pressed("disparo") and shoot ==1:
		shoot_laser()
	if Input.is_action_just_pressed("disparo") and shoot==2:
		shoot_laser()
		shoot_laser()
	if Input.is_action_just_pressed("disparo") and shoot==3:
		shoot_laser()
		shoot_laser()
		shoot_laser()
		

func take_damage(damage):
	hp -= damage
	if hp <=0:
		queue_free()
		get_tree().reload_current_scene()
		
func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)
		emit_signal("quitarvida")
		
func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)

func powerup():
	speed = speed + 300
func powerl():
	shoot += shoot
	
	
