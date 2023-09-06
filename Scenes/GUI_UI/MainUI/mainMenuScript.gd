extends Node2D

var moveLeft = false
var moveRight = false
var active = load("res://Scenes/Pointers/MenuPointerActive.png")
var inactive = load("res://Scenes/Pointers/MenuPointerInactive.png")

func _ready():
	$EscenaGUI/iniciarElMundo.disabled= true
	Input.set_custom_mouse_cursor(inactive)
	Input.set_custom_mouse_cursor(active, Input.CURSOR_POINTING_HAND)

func _process(delta):
	if Input.is_action_just_pressed("ui_Escape"):
		get_tree().quit()
	
	if moveRight:
		$Camera2D.position.x = clamp(-575, $Camera2D.position.x+30 ,575)
	if moveLeft:
		$Camera2D.position.x = clamp(-575, $Camera2D.position.x-30 ,575)
		
	if $Camera2D.position.x==575:
		moveRight=false
	elif $Camera2D.position.x==-575:
		moveLeft=false
	
func _on_iniciar_button_down():
	moveRight=true

func _on_cerrar_button_down():
	get_tree().quit()

func _on_volver_al_menu_inicial_button_down():
	moveLeft=true

func _on_iniciar_el_mundo_button_down():
	get_tree().change_scene_to_file("res://Scenes/World/FirstWorld/first_world.tscn")

func _on_max_seleccion_button_down():
	$SuicideShip.visible = true
	GLOBALMANAGER.playerSeleccionado = 1
	$EscenaGUI/iniciarElMundo.disabled= false

