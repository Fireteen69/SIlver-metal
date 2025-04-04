extends CanvasLayer

signal start_game


func _ready() -> void:
	$StartButton.show()
	$SilverBullet.show()
	$Sprite2D.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	start_game.emit()
	$StartButton.hide()
	$SilverBullet.hide()
	$Sprite2D.hide()
