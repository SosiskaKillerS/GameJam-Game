extends CharacterBody2D

@export var bullet_damage = 500
@export var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta




func _on_area_2d_body_entered(body):
	if body.is_in_group("mobs"):
		var enemy = body.get_script("res://src/Enemie 1/stamps.gd")
		enemy.hp -= bullet_damage
		if enemy.hp <= 0:
			body.queue_free()
			queue_free()
