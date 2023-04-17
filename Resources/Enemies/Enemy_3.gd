extends "res://Resources/Enemies/Enemies.gd"

export var speed_enemy_3 = 0.4
export var health_enemy_3 = 0.7

func _ready():
	speed = speed_enemy_3 * BASE_SPEED
	health = health_enemy_3 * BASE_HEALTH
	
	health_bar.max_value = health
	health_bar.value = health
