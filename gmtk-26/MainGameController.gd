extends Control

const RUNNING_GAME = "res://RunningMiniGame.tscn";
# Construct radar chart from player stats
func _ready() -> void:
	pass

func _on_dribbling_button_up() -> void:
	print("Dribbling Mini Game");

func _on_speed_button_up() -> void:
	call_deferred("_running_game");

func _running_game() -> void:
	get_tree().change_scene_to_file(RUNNING_GAME);

func _on_shooting_button_up() -> void:
	print("Shooting Mini Game");

func _on_offense_button_up() -> void:
	print("Offense Mini Game");

func _on_defense_button_up() -> void:
	print("Defense Mini Game");

func _on_passing_button_up() -> void:
	print("Passing Mini Game");
