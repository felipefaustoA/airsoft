extends RigidBody3D

@export var energy: float = 1.49 # joules
@export var bb_mass: float = 0.0002 # kg
@export var drag_coefficient : float = 0.47
@export var ball_radius : float = 0.003 # mm
@export var magnus_coefficient : float = 0.0000012 

const AIR_DENSITY : float = 1.225 # kg/m³

var ball_area : float
var has_drag : bool = true

func _ready() -> void:
	ball_area = PI * pow(ball_radius, 2)
	
func _physics_process(delta: float) -> void:
	if not has_drag:
		return
		
	var speed = linear_velocity.length()
	
	if speed > 0:
		var drag_force = 0.5 * AIR_DENSITY * pow(speed, 2) * drag_coefficient * ball_area
		var drag_dir = -linear_velocity.normalized()
		apply_central_force(drag_force * drag_dir)
		
		var magnus_direction = angular_velocity.cross(linear_velocity).normalized()
		var magnus_force_magnitude = magnus_coefficient * pow(speed, 2)
		apply_central_force(magnus_force_magnitude * magnus_direction)
