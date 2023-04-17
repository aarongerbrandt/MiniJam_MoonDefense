extends "res://Resources/Enemies/Enemies.gd"

export var speed_enemy_4 = 0.5
export var health_enemy_4 = 0.7

func _ready():
	speed = speed_enemy_4 * BASE_SPEED
	health = health_enemy_4 * BASE_HEALTH
	
	health_bar.max_value = health
	health_bar.value = health
