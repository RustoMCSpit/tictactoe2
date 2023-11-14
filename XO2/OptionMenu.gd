extends Control
signal GameMode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_sp_mode_pressed():
	Global.gamemode = 0

func _on_mp_mode_pressed():
	Global.gamemode = 1

func _on_sim_mode_pressed():
	Global.gamemode = 2

func _on_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
 
