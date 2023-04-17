extends KinematicBody2D

export var speed = 500.0

var target

func _init():
	set_as_toplevel(true)

func shoot(new_target):
	target = new_target

func _physics_process(delta):
	if target != null:
		move_and_collide(target.position)
