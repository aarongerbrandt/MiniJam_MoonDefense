extends PathFollow2D

const BASE_SPEED = 100
const BASE_HEALTH = 100

var speed = 0
var health = 1

onready var health_bar = $HealthBar

func _physics_process(delta):
	_move(delta)

func _move(delta):
	set_offset(get_offset() + (speed * delta))

func on_hit(damage):
	health -= damage
	if health <= 0:
		on_destroy()

func on_destroy():
	self.queue_free()
