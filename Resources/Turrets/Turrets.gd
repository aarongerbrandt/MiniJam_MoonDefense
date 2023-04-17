extends Area2D

signal placed

onready var turret = $Turret as Sprite
onready var base = $Base as Sprite
onready var hitbox = $Hitbox as CollisionObject2D
onready var turret_range = $Range as Area2D

const GRID_SIZE_PX = 64

var placing = true
var can_build = true
var on_cooldown = false
var enemy_array = []
var target
var type

var radius
var fire_rate

func _ready():
	fire_rate = GameData.tower_data[type]["rate_of_fire"]
	radius = GameData.tower_data[type]["range"] * GRID_SIZE_PX
	$Range/CollisionShape2D.get_shape().radius = radius
	modulate.a = 0.5

func _draw():
	if placing:
		draw_circle(Vector2(0, 0), radius, Color(100, 100, 100, 0.3))
		
func _physics_process(delta):
	if placing:
		global_position = get_global_mouse_position()
	elif enemy_array.size() > 0:
		_track_enemies()
		if not on_cooldown:
			_fire()
	else:
		target = null

func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and placing:
		build()

func _body_entered(body):
	if placing:
		if body.name == "TrackTilemap":
			can_build = false
			modulate = Color.red

func _body_exited(body):
	if placing:
		if body.name == "TrackTilemap":
			can_build = true
			modulate = Color.green

func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())

func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())

func build():
	if can_build:
		placing = false
		modulate.a = 1
		emit_signal("placed")

func _track_enemies():
	if not enemy_array.has(target) || target == null:
		target = _select_enemy()
	
	_turn(target)

func _select_enemy():
	var progress_array = []
	for enemy in enemy_array:
		progress_array.append(enemy.offset)
	var max_offset = progress_array.max()
	var idx = progress_array.find(max_offset)
	
	return enemy_array[idx]

func _turn(turret_target):
	if turret_target != null:
		var enemy_position = turret_target.global_position
		turret.look_at(enemy_position)

func _fire():
	#var bullet = load("res://Resources/Projectiles/Missile_1.tscn").instance()
	#bullet.shoot(target)
	#$Bullets.add_child(bullet)
	on_cooldown = true
	target.on_hit(GameData.tower_data[type]["damage"])
	yield(get_tree().create_timer(1 / fire_rate), "timeout")
	
	on_cooldown = false
	
