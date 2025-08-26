extends Node3D

@export var bb_scene: PackedScene
var energy = 1.49 
var mass = 0.00020

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var bb = bb_scene.instantiate()
	get_tree().root.add_child(bb)
	
	bb.global_transform.origin = $Muzzle.global_transform.origin
	
	var v = sqrt(2 * energy / mass)
	
	var dir = -global_transform.basis.z.normalized()
	
	bb.linear_velocity = dir * v
