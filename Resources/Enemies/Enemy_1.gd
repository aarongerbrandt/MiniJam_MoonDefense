extends "res://Resources/Enemies/Enemies.gd"

export var speed_enemy_1 = 1.0
export var health_enemy_1 = 0.25

func _ready():
	speed = speed_enemy_1 * BASE_SPEED
	health = health_enemy_1 * BASE_HEALTH
	
	health_bar.max_value = health
	health_bar.value = health
