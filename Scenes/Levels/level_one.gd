extends Control


# Declare member variables here. Examples:
onready var time_display = $TimeDisplay as Label

onready var timer = $UpgradeTimer as Timer

onready var upgrade_menu = $UpgradePopup as PopupMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_menu.add_radio_check_item("Item 1")
	upgrade_menu.add_radio_check_item("Item 2")
	upgrade_menu.add_radio_check_item("Item 3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_display.text = "%.1fs" % timer.time_left


func _on_UpgradeTimer_timeout():
	show_upgrade_menu()

func show_upgrade_menu():
	upgrade_menu.show()
