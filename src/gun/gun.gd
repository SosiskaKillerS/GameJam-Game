extends Sprite2D

@export var Bullet = preload("res://src/Bullet/bullet.tscn")
@export var shoot_timer = 0.3 
@export var timer = 0 

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Marker2D.global_transform

func get_input():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	get_input()
	if Input.is_action_pressed("SHOOT"):
		timer += delta 
		if timer >= shoot_timer: 
			shoot()
			timer -= shoot_timer 
	
