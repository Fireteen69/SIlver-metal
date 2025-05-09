extends StaticBody2D
signal exp
@onready var player = get_tree().current_scene.get_node("Player")
var direction: Vector2 = Vector2.ZERO
var new_direction = Vector2(0, 1)
var speed = 700
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		var moving =speed*direction*delta
		var player_distance = player.position - position
		if player_distance.length() <= 120:
			direction = player_distance.normalized()
		position+=moving

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		exp.emit
		queue_free()
