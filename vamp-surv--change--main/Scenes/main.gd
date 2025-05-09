extends Node2D
@onready var player=$Player
@onready var health=$Player/Health/health



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#player.hit.connect(_on_player_hit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_player_death() -> void:
	pass
	get_tree().call_group("Enemies", "queue_free")
