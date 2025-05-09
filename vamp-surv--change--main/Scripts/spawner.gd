extends Node2D
var enemy_health = 100
var max_enemy_health = 100
var skeleton = preload("res://Scenes/enemy.tscn")
@onready var player= $"../Player"
@export var spawn_amount: int=5
@onready var tilemap = "../TileMap"
@onready var max_enemies = 250
@export var enemy_distance: float=randf_range(500,650)
var enemy_count = 0
var mob_types:Array[PackedScene] = [skeleton]
func spawn_enemy(mob,spawnAmount:int):

	if spawn_amount >= max_enemies:
		return
	var player_position = player.global_position
	for spawn in spawnAmount:
		if spawn_amount >= max_enemies:
			break
		var mob_spawn= mob.instantiate()
		var spawn_position_candidate = player_position + Vector2.RIGHT.rotated(randi_range(0,360))*enemy_distance
		var p =  validate_position(spawn_position_candidate)
		if p:
			mob_spawn.position = spawn_position_candidate
# Spawn the mob by adding it to the Main scene.
		get_tree().root.add_child(mob_spawn)
		enemy_count+=1
func validate_position(p_pos: Vector2) -> bool:
	var is_valid_position := true
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		if enemy.global_position.distance_to(p_pos) < 20:
			is_valid_position = false
			break
	return is_valid_position
func _on_timer_timeout() -> void:
	if enemy_count<max_enemies:
		spawn_enemy(skeleton,spawn_amount)
		


func _on_hud_start_game() -> void:
	$Timer.start()
	




func _on_player_death() -> void:
	pass


func _on_hud_retry_game() -> void:
	$Timer.start()
	
	
