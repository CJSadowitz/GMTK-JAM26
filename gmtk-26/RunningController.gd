extends Node2D

const MAIN_SCENE = "res://MainGame.tscn"

const RUN_SPEED = 100;
const NUM_OF_RUNNERS = 25;
var runners_remaining = NUM_OF_RUNNERS;

const GREAT_SKILL_CHECK_BONUS = 0.3;
const GOOD_SKILL_CHECK_BONUS  = 0.1;

@onready var running_player = $"Player";
var spawn_width = 0;

var runners = [];

var in_good = false;
var in_great = false;

func _ready() -> void:
	spawn_width = get_window().size.x;

func _process(delta: float) -> void:
	update_runner_position(delta);
	if Input.is_action_just_pressed("Skill Check"):
		if in_great:
			TeamStats.speed += GREAT_SKILL_CHECK_BONUS;
		elif in_good:
			TeamStats.speed += GOOD_SKILL_CHECK_BONUS;
		else:
			# Play a you missed sound no deductions
			pass
	# Return to main scene
	if runners.size() == 0 and runners_remaining == 0:
		get_tree().change_scene_to_file(MAIN_SCENE);

func update_runner_position(delta):
	var i = 0;
	# Move the runners
	for runner in runners:
		runner[0].position.y += runner[1] * RUN_SPEED * delta;
		
		# Remove from computation when they run off of screen
		if runner[0].position.y > get_window().size.y + 10:
			remove_child(runner[0]);
			runners.pop_at(i);
		i += 1;

func _on_timer_timeout() -> void:
	if runners_remaining == 0:
		return;
	runners_remaining -= 1;
	
	if spawn_width != 0:
		var new_runner = running_player.duplicate();
		var x_spawn = randi() % spawn_width;
		new_runner.position = Vector2(x_spawn, -100);
		var run_speed = randi() % 5 + 1;
		runners.append([new_runner, run_speed]);
		add_child(new_runner);

func _on_great_area_body_entered(_body: Node2D) -> void:
	in_great = true;

func _on_great_area_body_exited(_body: Node2D) -> void:
	in_great = false;

func _on_good_area_body_entered(_body: Node2D) -> void:
	in_good = true;

func _on_good_area_body_exited(_body: Node2D) -> void:
	in_good = false;
