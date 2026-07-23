extends Control

# Construct radar chart from player stats
func _ready() -> void:
	pass

func _on_dribbling_button_up() -> void:
	print("Dribbling Mini Game");
	
func _on_speed_button_up() -> void:
	print("Running Mini Game");

func _on_shooting_button_up() -> void:
	print("Shooting Mini Game");

func _on_offense_button_up() -> void:
	print("Offense Mini Game");

func _on_defense_button_up() -> void:
	print("Defense Mini Game");

func _on_passing_button_up() -> void:
	print("Passing Mini Game");
