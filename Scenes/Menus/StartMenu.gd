extends Control


const level_one = "res://Scenes/Levels/level_one.tscn" 
onready var play_button = $InterfaceContainer/MenuButtons/PlayButton as Button

func _ready():
	play_button.grab_focus()
	if OS.get_name() == "HTML5":
		$InterfaceContainer/MenuButtons/ExitButton.visible = false

func _on_PlayButton_button_up():
	get_tree().change_scene("res://Scenes/Levels/level_one.tscn")


func _on_ExitButton_button_up():
	get_tree().quit()
