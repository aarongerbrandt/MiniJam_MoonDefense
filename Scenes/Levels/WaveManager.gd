extends Node

const WAVE_COOLDOWN = 3.0

var current_enemies = 0
var current_wave = 0
var wave_over = false
var num_waves = -1

onready var enemy_path = $"../EnemyPath"
onready var wave_data = GameData.wave_data["waves"]

func _ready():
	num_waves = GameData.wave_data["num_waves"]
	connect("enemy_died", self, "_on_enemy_died")

func _on_level_start():
	print("Total waves %d" % num_waves)
	for wave_num in range(num_waves):
		_spawn_wave(wave_num)
		
		var max_timeout = 100000
		while(enemy_path.get_child_count() > 0):
			max_timeout -= 1
			if max_timeout <= 0:
				return
		
		yield(get_tree().create_timer(WAVE_COOLDOWN), "timeout")

func _spawn_wave(current_wave):
	print("Spawning wave: %d" % current_wave)
	wave_over = false
	var current_wave_data = wave_data[current_wave]
	current_enemies = current_wave_data["wave_size"]
	
	for enemy_data in current_wave_data["enemies"]:
		yield(get_tree().create_timer(enemy_data["time"]), "timeout")
		_spawn_enemy(enemy_data["name"])

func _spawn_enemy(enemy_name):
	var locator = "res://Resources/Enemies/%s.tscn" % enemy_name
	var enemy = load(locator).instance()
	enemy.type = enemy_name
	enemy_path.add_child(enemy)

