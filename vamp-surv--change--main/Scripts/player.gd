extends CharacterBody2D
signal death
signal hit
var health=105
var max_health=100
#@onready var health=$%health
@export var speed = 270
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("walk_right"):
		velocity.x += 1
	if Input.is_action_pressed("walk_left"):
		velocity.x -= 1
	if Input.is_action_pressed("walk_down"):
		velocity.y += 1
	if Input.is_action_pressed("walk_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	health-=5
	hit.emit(health,max_health)
	if health < 1:
		death.emit()
		queue_free()
		
