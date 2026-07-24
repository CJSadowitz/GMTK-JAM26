extends Polygon2D

const RADIUS = 500.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var stat_scale = []
	stat_scale.append(clamp(TeamStats.speed,   1.0, 10.0) / 100.0);
	stat_scale.append(clamp(TeamStats.offense, 1.0, 10.0) / 100.0);
	stat_scale.append(clamp(TeamStats.shoot,   1.0, 10.0) / 100.0);
	stat_scale.append(clamp(TeamStats.dribble, 1.0, 10.0) / 100.0);
	stat_scale.append(clamp(TeamStats.passing, 1.0, 10.0) / 100.0);
	stat_scale.append(clamp(TeamStats.defense, 1.0, 10.0) / 100.0);
	var points = PackedVector2Array()

	for i in range(6):
		var angle = i * TAU / 6.0
		points.append(Vector2(
			cos(angle) * RADIUS * stat_scale[i],
			sin(angle) * RADIUS * stat_scale[i]
		))

	polygon = points
	color = Color.RED
	
	position = Vector2(150, 150);


func _process(_delta: float) -> void:
	pass
