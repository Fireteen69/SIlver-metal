extends CanvasLayer

signal start_game
signal retry_game


func _ready() -> void:
	$StartButton.show()
	$SilverBullet.show()
	$Title.show()
	$SettingsButton.show()
	$DeathScene.hide()
	$RetryButton.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	start_game.emit()
	$StartButton.hide()
	$SilverBullet.hide()
	$Title.hide()
	$SettingsButton.hide()




func _on_player_death() -> void:
	$DeathScene.show()
	$RetryButton.show()
	

#FIX THIS!!!!!!
func _on_retry_button_pressed() -> void:
	retry_game.emit()
	$StartButton.hide()
	$SilverBullet.hide()
	$Title.hide()
	$SettingsButton.hide()
	$DeathScene.hide()
	$RetryButton.hide()
	
