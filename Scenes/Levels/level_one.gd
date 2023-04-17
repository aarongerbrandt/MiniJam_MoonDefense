extends Control

const num_upgrade_options = 3

# Declare member variables here. Examples:
onready var time_display = $TimeDisplay as Label
onready var timer = $UpgradeTimer as Timer
onready var upgrade_menu = $UpgradePopup as PopupMenu

signal level_start

var tower_list = [
	load("res://Resources/Turrets/Turret_1.tscn"),
	load("res://Resources/Turrets/Turret_2.tscn"),
	load("res://Resources/Turrets/Turret_3.tscn"),
]

var potential_upgrades = [
	preload("res://Assets/Images/TurretParts/turret_top_5.png"),
	preload("res://Assets/Images/TurretParts/turret_top_6.png"),
	preload("res://Assets/Images/TurretParts/turret_top_3.png"),
]
var upgrade_options = []

func _ready():
	show_upgrade_menu()

func _process(_delta):
	_update_upgrade_timer()

func _add_upgrade_options(numOptions):
	_reset_menu()
	
	var turretData = readTurretData()
	
	for i in numOptions:
		turretData.shuffle()
		var option = turretData.pop_back()
		
		var icon = load(option["assetPath"])
		var name = option["name"]
		var id = option["id"]
		
		upgrade_menu.add_icon_check_item(icon, name, id)

func _on_UpgradeTimer_timeout():
	show_upgrade_menu()

func _update_upgrade_timer():
	# Display time during countdown, but remove timer when menu is up
	if(timer.time_left > 0):
		time_display.text = "%.1fs" % timer.time_left
	else:
		time_display.text = ""

func show_upgrade_menu():
	_add_upgrade_options(num_upgrade_options)
	upgrade_menu.show()
	#readTurretData()

func _reset_menu():
	upgrade_menu.clear()
	upgrade_options.clear()

func _on_UpgradePopup_id_pressed(id):
	_build_tower(id)

func _build_tower(tower_id):
	var tower = tower_list[tower_id].instance()
	tower.type = "Turret_%d" % (tower_id + 1)
	$Turrets.add_child(tower)
	tower.connect("placed", self, "_on_placed")

func _on_placed():
	timer.start()
	emit_signal("level_start")
	print("level start emitted")

func readTurretData():
	return GameData.tower_data.values()
