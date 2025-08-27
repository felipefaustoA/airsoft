extends RigidBody3D

@export var energy: float = 1.49 # Joules
@export var bb_mass: float = 0.0002 # kg
@export var drag_coefficient : float = 0.47
@export var dir: Vector3
@export var ball_radius : float = 0.003

const AIR_DENSITY : float = 1.225 # kg/m³

var ball_area : float
var has_drag : bool = true

func _ready() -> void:
	ball_area = PI * pow(ball_radius, 2)
	
func _physics_process(delta: float) -> void:
	var speed = linear_velocity.length()
	
	if speed > 0 and has_drag:
		var drag_force = 0.5 * AIR_DENSITY * pow(speed, 2) * drag_coefficient * ball_area
		var drag_dir = -linear_velocity.normalized()
		var final_drag_force = drag_force * drag_dir
		
		apply_central_force(final_drag_force)
		
		
#func _process(delta: float) -> void:
	#print(global_position.z)
