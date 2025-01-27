extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATION_SPEED : float = 0.5
@onready var body : Node3D = $BodyController
@onready var tiles : Array = get_tree().get_nodes_in_group("ColoredTiles")
@onready var rayCast : RayCast3D = $RayCast3D

func _process(delta: float) -> void:
	var tile = rayCast.get_collider()
	if tile != null and tile.is_in_group("ColoredTiles"):
		print("estoy colisionando con un cuadradito!")
		tile.free()
	else:
		print("no estoy colisionando!")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"): #  and is_on_floor()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# body.rotate_y(1.0) gira siempre
	if direction:
		body.rotate_y(position.angle_to(direction))
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
