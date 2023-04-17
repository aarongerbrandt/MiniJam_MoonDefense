extends Node

const WAVE_COOLDOWN = 3.0

var current_enemies = 0
var current_wave = 0

var num_waves = -1

onready var enemy_path = $"../EnemyPath"
onready var wave_data = _load_wave_data()

func _on_level_start():
	for wave_num in num_waves:
		_spawn_wave(wave_num)
		yield(get_tree().create_timer(WAVE_COOLDOWN), "timeout")

func _spawn_wave(current_wave):
	var current_wave_data = wave_data[current_wave]
	current_enemies = current_wave_data["wave_size"]
	
	for enemy_data in current_wave_data["enemies"]:
		yield(get_tree().create_timer(enemy_data["time"]), "timeout")
		_spawn_enemy(enemy_data["name"])

func _spawn_enemy(enemy_name):
	var enemy = load("res://Resources/Enemies/" + enemy_name + ".tscn").instance()
	enemy_path.add_child(enemy)

func _load_wave_data():
	var file = File.new()
	var jsonString = ""
	
	if file.file_exists("res://Resources/Data/WaveData.json"):
		file.open("res://Resources/Data/WaveData.json", File.READ)
		jsonString = file.get_as_text()
		file.close()
	
	var data = JSON.parse(jsonString).result
	num_waves = data["num_waves"]
	return data["waves"]
