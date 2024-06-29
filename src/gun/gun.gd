extends Sprite2D

@export var Bullet : PackedScene
var preloadBullet = preload("res://src/Bullet/bullet.tscn")
var shoot_timer = 0.5 # переменная для хранения интервала между выстрелами в секундах
var timer = 0 # переменная для отслеживания текущего времени таймера

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Marker2D.global_transform

func get_input():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	get_input()
	if Input.is_action_pressed("SHOOT"):
		timer += delta # увеличиваем таймер на текущий шаг времени
		if timer >= shoot_timer: # проверяем, прошло ли достаточно времени с момента последнего выстрела
			shoot()
			timer -= shoot_timer # сбрасываем таймер
	
