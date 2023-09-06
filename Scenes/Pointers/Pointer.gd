extends Node2D

var scaler = Vector2(0.01,0.01)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	global_position=get_global_mouse_position()
	$InGame.visible=true
	$InGame/Hexagon1.rotation_degrees +=1
	$InGame/Hexagon2.rotation_degrees -=1
	$InGame/Center.scale -= scaler
	if $InGame/Center.scale.x <= 0.75 or $InGame/Center.scale.x >= 1:
		scaler = scaler * -1

func hideCursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	visible=false

func showCursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	visible=true
