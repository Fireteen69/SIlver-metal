extends Area2D
var direction :Vector2
var speed = 810
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction*delta*speed
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		get_tree().create_timer(.89).timeout
		queue_free()
