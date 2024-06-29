extends Area2D

@export var speed = 1000
@export var damage = 1 

func _physics_process(delta):
	move_and_slide(Vector2.RIGHT * speed)
