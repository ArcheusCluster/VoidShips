extends Node2D


#variables
var escapeMenuVisible= false

func _ready():
	pass

func _process(delta):
	vigilarMenuEscape()


func vigilarMenuEscape():
	if Input.is_action_just_pressed("ui_Escape"):
		if escapeMenuVisible == false:
			get_tree().call_group("pointerGroup","hideCursor")
			$MenuGUI.visible= true
			escapeMenuVisible= true
		else:
			get_tree().call_group("pointerGroup","showCursor")
			$MenuGUI.visible= false
			escapeMenuVisible= false


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/GUI_UI/MainUI/mainMenu.tscn")
