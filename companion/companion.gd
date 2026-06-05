extends CharacterBody2D

@export var speed: float = 150
@export var follow_distance: float = 100
@export var player_path: NodePath


@onready var agent: NavigationAgent2D = $NavigationAgent2D
var player_ref: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	player_ref = get_node (player_path)
	agent.path_desired_distance = 8.0
	agent.target_desired_distance = 4.0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if player_ref == null:
		return
	
	var flug_ziel = player_ref.global_position + Vector2(0, -80)
	
	var direction = global_position.direction_to(flug_ziel)
	var distance = global_position.distance_to(flug_ziel)
	
	if distance < 10.0:
		velocity = Vector2.ZERO
	else:
		velocity = direction * speed
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true 
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	
	agent.target_position = player_ref.global_position

	var distance_to_player = global_position.distance_to(player_ref.global_position)
	
	if distance_to_player < follow_distance:
		velocity = Vector2.ZERO
	else:
		velocity = direction.normalized () * speed
	
	move_and_slide()
	
