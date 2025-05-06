extends CharacterBody2D
signal death
signal hit
var health=100
var max_health=10
var exp=0
var max_exp=100

#@onready var health=$%health
#@onready var enemy = get_tree().current_scene.get_node("skeleton")
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
	print(health)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		health-=5
		hit.emit(health,max_health)
		if health < 1:
			death.emit()
			$".".hide()
		

func _ready():
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() == 0:
		return

# Pick random enemy
		var target = enemies[randi() % enemies.size()]

	# Rotate to face the target
		look_at(target.global_position)

	# Fi-re bullet
		var bullet = bullet_scene.instantiate()
		bullet.position = global_position
		bullet.look_at(target.global_position)
		bullet.direction = (target.global_position - global_position).normalized()
		get_parent().add_child(bullet)
	pass

func _on_hud_retry_game() -> void:
	health = 100
	$".".show()


func _on_star_exp() -> void:
	exp+=5
	if exp>=max_exp:
		exp-=max_exp
		max_exp*1.05
