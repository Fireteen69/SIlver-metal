extends Node2D
@onready var skeleton = preload("res://Scenes/enemy.tscn")
@onready var player= $"../Player"
@export var spawn_amount: float=5
@onready var tilemap = "../TileMap"
@onready var max_enemies = 250
@export var enemy_distance: float=randf_range(-200,200)
var enemy_count = 0




var mob_types:Array[PackedScene] = [skeleton]
func spawn_enemy(mob,spawn_amount):
	if spawn_amount >= max_enemies:
		return
	var player_position = player.global_position
	for spawn in enemy_count:
		if spawn_amount >= max_enemies:
			break
		var mob_spawn= mob.instantiate()
		var spawn_position_candidate = player_position + Vector2.RIGHT.rotated(randi_range(0,360))*enemy_distance
		var p = await validate_position(spawn_position_candidate)
		if p:
			mob_spawn.position = spawn_position_candidate
		mob_spawn 
# Spawn the mob by adding it to the Main scene.
		get_tree().root.add_child(mob_spawn)
		enemy_count+=1

func validate_position(p_pos: Vector2) -> bool:
	var is_valid_position := true
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if enemy.global_position.distance_to(p_pos) < 20:
			is_valid_position = false
			break
	
	return is_valid_position




func _on_timer_timeout() -> void:
	if enemy_count<max_enemies:
		spawn_enemy(mob_types[0],spawn_amount)
