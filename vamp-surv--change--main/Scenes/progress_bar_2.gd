
extends ProgressBar
@onready var player = get_tree().current_scene.get_node("Player")

func _ready() -> void:
	min_value=0
	max_value= player.max_exp
	value=player.exp
func _process(delta: float) -> void:
	value= player.exp
	max_value= player.max_exp

func _on_player_hit() -> void:
	value=player.exp
	max_value= player.max_exp


func _on_player_levelup() -> void:
	value= player.exp
	max_value= player.max_exp


func _on_star_exp_change() -> void:
	value= player.exp
	max_value= player.max_exp
