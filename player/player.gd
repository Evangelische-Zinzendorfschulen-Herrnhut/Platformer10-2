extends CharacterBody2D

const GRAVITY: float = 8.1
const SPEED: int = 50
const JUMP_POWER: int = -200

var player_skin:String = "m"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = true
		if player_skin == "m":
			$AnimatedSprite2D.play("run_m")
		elif player_skin == "f":
			$AnimatedSprite2D.play("run_f")
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
		if player_skin == "m":
			$AnimatedSprite2D.play("run_m")
		elif player_skin == "f":
			$AnimatedSprite2D.play("run_f")
	else:
		velocity.x = 0
		if player_skin == "m":
			$AnimatedSprite2D.play("idle_m")
		elif player_skin == "f":
			$AnimatedSprite2D.play("idle_f")
		
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("jump"):
		velocity.y += JUMP_POWER
	
	# Note: If there are more than two skins, *two* input actions 
	# like 'change_skin_+' and 'change_skin_-' should be implemented.
	if Input.is_action_just_pressed("change_skin"):
		if player_skin == "m":
			player_skin = "f"
		else:
			player_skin = "m"
	
	move_and_slide()
