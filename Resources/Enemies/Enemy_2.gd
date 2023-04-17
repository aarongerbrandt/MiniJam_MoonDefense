extends "res://Resources/Enemies/Enemies.gd"

export var speed_enemy_2 = 0.5
export var health_enemy_2 = 0.3

func _ready():
	speed = speed_enemy_2 * BASE_SPEED
	health = health_enemy_2 * BASE_HEALTH
	
	health_bar.max_value = health
	health_bar.value = health
