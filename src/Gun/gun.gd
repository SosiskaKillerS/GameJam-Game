extends Sprite2D

@export var shootSpeed = 1 

const BULLET = preload("res://src/Bullet/bullet.tscn")

@onready var marker_2d = $Marker2D
@onready var ShootSpeedTime = $ShootSpeedTime

var canShoot = true 
var bulletDirection  = Vector2(1,0)

func _ready():
	ShootSpeedTime.wait_time = 1/ shootSpeed
func get_input():
	look_at(get_global_mouse_position())


func shoot():
	if canShoot:
		canShoot = false 
		ShootSpeedTime.start() 
		var bulletNode = BULLET.instance()
		
		bulletNode.set_direction(bulletDirection)
		get_tree().root.add_child(bulletNode)
		bulletNode.global_position = marker_2d.global_position

func _physics_process(delta):
	get_input()
	
	


func _on_shoot_speed_time_timeout(direction):
	canShoot = true 
	bulletDirection = direction
	

