extends CanvasLayer

func _ready() -> void:
	hide()

func _on_node_2d_killed() -> void:
	show()
