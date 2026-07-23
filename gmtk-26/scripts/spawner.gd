extends Area2D

var blocks = 0
var misses = 0

var can_be_hit = true

@onready var spawn_points = $"../spawnpoints".get_children()
@onready var timer = $"../Timer"

func move_target():
	var marker = spawn_points.pick_random()
	global_position = marker.global_position
	
	show()
	$CollisionShape2D.set_deferred("disabled", false)
	can_be_hit = true

func _on_body_entered(body: Node2D) -> void:
	can_be_hit = false
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	
	blocks += 1
	
	
	timer.start()
	print(blocks, "  |  ", misses)
	
func _on_timer_timeout() -> void:
	if !can_be_hit:
		move_target()
		return
		
	misses += 1
	move_target()
	

func _ready() -> void:
	move_target()
