extends Sprite2D

const BACKGROUND_2_OFFSET = 170 + 100
var DEFAULT_POSITION = position
#@onready var game_viewport_width = $"/root".size.x
# ProjectSettings.get_setting("display/window/size/viewport_width")

# @onready var PLAYER_SPEED = $"..".SPEED
#@onready var player_movement_x = $"..:velocity:x"
#@onready var DRAG_MARGIN_L = -$"../Camera2D".drag_left_margin * game_viewport_width/2
#@onready var DRAG_MARGIN_R = $"../Camera2D".drag_right_margin * game_viewport_width/2
# @onready var DRAG_MARGIN_UP ??

@onready var background_2 = $"../Background_2"


func _physics_process(delta) -> void:
	
#	if Input.is_action_pressed("left"):
#		if abs(position.x) > DRAG_MARGIN_L:
#			position.x += -1 #-int(player_movement_x)
	
#	elif Input.is_action_pressed("right"):
#		if abs(position.x) < DRAG_MARGIN_R:
#			position.x += -1 #-int(player_movement_x)

	
	var camera_drag_offset = $"../Camera2D".get_target_position() - $"../Camera2D".global_position
	position = DEFAULT_POSITION + camera_drag_offset

	background_2.position = position + Vector2(0, BACKGROUND_2_OFFSET)
