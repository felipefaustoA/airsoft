extends RigidBody3D

@export var energy: float = 1.49
@export var bb_mass: float = 0.002  
@export var direction: Vector3 = Vector3.FORWARD  

func _ready():
	var v = sqrt((2.0 * energy) / bb_mass)
	linear_velocity = direction.normalized() * v
