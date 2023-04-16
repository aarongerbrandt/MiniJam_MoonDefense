extends Control

const num_upgrade_options = 3

# Declare member variables here. Examples:
onready var time_display = $TimeDisplay as Label
onready var timer = $UpgradeTimer as Timer
onready var upgrade_menu = $UpgradePopup as PopupMenu

var potential_upgrades = [
	preload("res://Assets/Images/TurretParts/turret_top_5.png"),
	preload("res://Assets/Images/TurretParts/turret_top_6.png"),
	preload("res://Assets/Images/TurretParts/turret_top_3.png"),
]
var upgrade_options = []

func _ready():
	show_upgrade_menu()

func _process(delta):
	_update_upgrade_timer()

func _add_upgrade_options(numOptions):
	_reset_menu()
	
	var turretData = readTurretData()
	
	for i in numOptions:
		turretData.shuffle()
		var option = turretData.pop_back()
		
		var icon = load(option["assetPath"])
		var name = option["name"]
		var desc = option["description"]
		
		upgrade_menu.add_icon_check_item(icon, name, i + 1)
		# upgrade_menu.add_icon_radio_check_item(icon, "Item %d" % i, i)
	# TODO: Change to actually generate options

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

func _reset_menu():
	upgrade_menu.clear()
	upgrade_options.clear()

func _on_UpgradePopup_id_pressed(id):
	print("%d pressed" % id)
	timer.start()

func readTurretData():
	var file = File.new()
	var jsonString = ""
	
	if file.file_exists("res://Resources/Data/TurretData.json"):
		file.open("res://Resources/Data/TurretData.json", File.READ)
		jsonString = file.get_as_text()
		file.close()
		
	var turretData = JSON.parse(jsonString).result
	return turretData
