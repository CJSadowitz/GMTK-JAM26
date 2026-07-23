extends Control

const MAIN_GAME_SCENE = "res://"
const SETTINGS_SCENE  = "res://"

func _ready() -> void:
	pass # Replace with function body.

func _on_start_button_button_up() -> void:
	print("Start Button")
	# get_tree().change_scene_to_file(MAIN_GAME_SCENE)

func _on_settings_button_button_up() -> void:
	print("Settings Button")
	# get_tree().change_scene_to_file(SETTINGS_SCENE)
