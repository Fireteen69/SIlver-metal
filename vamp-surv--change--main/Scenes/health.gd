extends TextureProgressBar
@onready var player = get_tree().current_scene.get_node("Player")

func _ready() -> void:
	var   max_value= player.max_health
	var  value=player.health


func _on_player_hit() -> void:
	pass # Replace with function body.
