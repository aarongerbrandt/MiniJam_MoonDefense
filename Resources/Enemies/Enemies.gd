extends PathFollow2D

const BASE_SPEED = 100
const BASE_HEALTH = 100

var speed = 0
var health = 1
var type

onready var body = $KinematicBody2D as KinematicBody2D
onready var health_bar = $HealthBar as TextureProgress

func _ready():
	speed = GameData.enemy_data[type]["speed"] * BASE_SPEED
	health = GameData.enemy_data[type]["health"] * BASE_HEALTH
	
	health_bar.max_value = health
	health_bar.value = health
	health_bar.set_as_toplevel(true)

func _physics_process(delta):
	_move(delta)

func _move(delta):
	set_offset(get_offset() + (speed * delta))
	health_bar.set_position(position - Vector2(30, 30))

func on_hit(damage):
	health -= damage
	health_bar.value = health
	if health <= 0:
		on_destroy()

func on_destroy():
	self.queue_free()
