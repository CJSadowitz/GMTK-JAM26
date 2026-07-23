extends Node2D

const RUN_SPEED = 100;

var running_player = Sprite2D.new();
var spawn_width = 0;

var runners = [];

func _ready() -> void:
	var image = Image.load_from_file("res://icon.svg")
	var texture = ImageTexture.create_from_image(image)
	running_player.texture = texture;
	spawn_width = get_window().size.x;

func _process(delta: float) -> void:
	var i = 0;
	print (runners.size());
	for runner in runners:
		runner[0].position.y += runner[1] * RUN_SPEED * delta;
		
		# Remove from computation when they run off of screen
		if runner[0].position.y > get_window().size.y + 10:
			remove_child(runner[0]);
			runners.pop_at(i);
		i += 1;

func _on_timer_timeout() -> void:
	if spawn_width != 0:
		var new_runner = running_player.duplicate();
		var x_spawn = randi() % spawn_width;
		new_runner.position = Vector2(x_spawn, -100);
		var run_speed = randi() % 5 + 1;
		runners.append([new_runner, run_speed]);
		add_child(new_runner);
