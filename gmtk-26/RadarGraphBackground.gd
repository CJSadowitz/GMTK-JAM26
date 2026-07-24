extends Polygon2D

const RADIUS = 50.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var points = PackedVector2Array()

	for i in range(6):
		var angle = i * TAU / 6.0
		points.append(Vector2(cos(angle) * RADIUS, sin(angle) * RADIUS));

	polygon = points
	color   = Color.BLUE
	
	position = Vector2(150, 150);


func _process(_delta: float) -> void:
	pass
	
