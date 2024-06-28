extends CharacterBody2D

@export var speed = 500 
@export var shootSpeed = 1

const BULLET = preload("res://src/bullets/bullet.tscn")

@onready var marker_2d = $Marker2D
@onready var shoot_speed_timer = $ShootSpeedTimer

var canShoot = true 
var bulletDirection = Vector2(1,0)

func get_input(): 
	var input_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = input_direction * speed 
	if input_direction != Vector2.ZERO:
		setup_direction(input_direction)
func _ready():
	shoot_speed_timer.wait_time = 1.0/ shootSpeed
func shoot():
	if canShoot:
		canShoot = false
		shoot_speed_timer.start()
	var bulletNode = BULLET.instantiate()
	
	bulletNode.set_direction(bulletDirection)
	get_tree().root.add_child(bulletNode)
	bulletNode.global_position = marker_2d.global_position


	
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_pressed("ATTACK"):
		shoot()
	


func _on_shoot_speed_timer_timeout():
	canShoot = true
func setup_direction(direction):
	bulletDirection = direction
	
	if direction.x > 0	:
		scale.x = 1 
		rotation_degrees = 0 
	elif direction.x < 0:
		scale.x = 1 
		rotation_degrees = 0
	elif direction.y < 0:
		scale.x = 1
		rotation_degrees = -90 
	elif direction.y > 0:
		scale.x = 1 
		rotation_degrees = 90
