extends CharacterBody2D
signal death
signal hit
signal levelup
var health=100
var max_health=100
var exp=0
var max_exp=150
var level=1
var bullet_atk=0
var roll_speed=100
@onready var hurtnoise=$HitHurt
@onready var pewpew=$Pewpew
@onready var bullet_timer =$bullet_timer
@onready var bullet_scene =preload("res://Scenes/bullet.tscn")
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
	if exp>=max_exp:
		exp=0
		level+=1
		max_exp=round(max_exp*1.50)
		max_health+=10
		health=max_health
		bullet_timer.wait_time*=.85
		bullet_atk+=5
		levelup.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		health-=5
		hit.emit()
		hurtnoise.play()
		if health < 1:
			death.emit()
			$".".hide()




func _ready():
	pass

func _on_hud_retry_game() -> void:
	health = 100
	exp=0
	max_exp=50
	max_health=100
	hit.emit()
	$".".show()




func _on_timer_timeout() -> void:
	var enemies = get_tree().get_nodes_in_group("Enemies")
	if enemies.size() == 0:
		return

# Pick random enemy
	var target = enemies[randi() % enemies.size()]

	var bullet = bullet_scene.instantiate()
	pewpew.play()
	bullet.position = global_position
	bullet.look_at(target.global_position)
	bullet.direction = (target.global_position - global_position).normalized()
	get_parent().add_child(bullet)


func _on_hud_start_game() -> void:
	bullet_timer.start()
