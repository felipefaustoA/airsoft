extends Node3D

@export var bb_scene: PackedScene
const METERS_TO_FEET = 3.28084

var has_drag : bool = true

func _input(event: InputEvent):
	if event.is_action_pressed("shoot"):
		shoot()
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_drag"):
		has_drag = !has_drag
		print("Arrasto ativado: ", has_drag)

func shoot():
	var bb = bb_scene.instantiate()
	get_tree().root.add_child(bb)
	
	bb.global_transform.origin = $Muzzle.global_transform.origin
	
	bb.has_drag = has_drag
	
	var v_mps = sqrt(2 * bb.energy / bb.bb_mass)
	var v_fps = v_mps * METERS_TO_FEET
	
	print("Velocidade do projétil: ", v_fps, " pés/segundo (ft/s)")
	
	var fire_dir = -$Muzzle.global_transform.basis.z.normalized()
	var backspin_axis = fire_dir.cross(Vector3.UP).normalized()
	
	bb.linear_velocity = fire_dir * v_mps
	bb.angular_velocity = 150 * backspin_axis
