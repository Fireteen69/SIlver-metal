extends CharacterBody2D
var enemy_health = 100
var max_enemy_health = 100
@onready var player = get_tree().current_scene.get_node("Player")
@onready var exp_scene=preload("res://Scenes/star.tscn")

var direction: Vector2 = Vector2.ZERO
var new_direction = Vector2(0, 1)
var timer = 0
@export var speed = 65

var rng = RandomNumberGenerator.new()
func _ready() -> void:
	pass


func _physics_process(delta):
	if enemy_health <= 0:
		queue_free()
	var movement = speed * direction * delta
	var collision = move_and_collide(movement)
	if collision != null and collision.get_collider().name != "player":
		direction = direction.rotated(rng.randf_range(PI / 4, PI / 2))
		timer = rng.randf_range(2, 5)
	else:
		timer = 0


func _on_timer_timeout():
	if player != null:
		var player_distance = player.position - position
		if player_distance.length() <= 50:
			new_direction = player_distance.normalized()
		elif player_distance.length() <= 99999999900 and timer <= 0:
			direction = player_distance.normalized()
		elif timer <= 0:
			var random_direction = rng.randf()
			if random_direction < 0.05:
				direction = Vector2.ZERO
			elif random_direction < 0.1:
				direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
	
func _on_hud_start_game() -> void:
	$Speed.start()
	
	
func _on_speed_timeout() -> void:
	if speed <=300:
		speed +=5


func _on_player_death() -> void:
	queue_free()
 

func _on_hud_retry_game() -> void:
	enemy_health = 0




func _process(delta: float) -> void:
	if enemy_health <= 0:
		var exp= exp_scene.instantiate()
		get_parent().root.get_node("Main").add_child(exp)
		queue_free()



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		enemy_health-=20
		print(enemy_health)
