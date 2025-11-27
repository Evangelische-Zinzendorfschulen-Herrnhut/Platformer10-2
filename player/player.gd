extends CharacterBody2D


const GRAVITY: float = 8.1
const SPEED: int = 50
const JUMP_POWER: int = -150

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
		$AnimatedSprite2D.play("run")
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("idle")
		
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("jump"):
		velocity.y += JUMP_POWER
	
	move_and_slide()
