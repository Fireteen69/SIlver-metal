extends ProgressBar
@onready var player = get_tree().current_scene.get_node("Player")

func _ready() -> void:
	min_value=0
	max_value= player.max_health
	


func _on_player_hit() -> void:
	value=player.health
