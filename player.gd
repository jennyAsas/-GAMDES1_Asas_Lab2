extends CharacterBody2D


const SPEED = 3000.0
const JUMP_VELOCITY = -4000.0

var health = 100
var player_name = "Kuya Kim"
var level = 67



func _ready():
	print(player_name, "has entered with the scene with ", health, "HP.")
	take_damage(12)
	player_level()
	
func take_damage(amount):
	health -= amount
	print(player_name, " Health is now:", health)
func player_level():
	print(player_name, " is now entering leve ", level)

	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
