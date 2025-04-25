extends Node2D
@onready var player=$Player
@onready var health=$Player/Health/health
@onready var health_value=player.health
@onready var max_health=player.max_health
@onready var bar_value=health.value



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.hit.connect(_on_player_hit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_hit(health_value,max_health):
	bar_value=health_value
	print(bar_value)


func _on_player_death() -> void:
	pass
	get_tree().call_group("Enemies", "queue_free")
