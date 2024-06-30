extends Area2D
@export var bullet_damage = 500
@export var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta
	

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.take_damage(bullet_damage)
		body.queue_free()
	queue_free()

