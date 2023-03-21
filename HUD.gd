extends CanvasLayer

signal start_game

func show_message(text):
	$MarginContainer/VBoxContainer/Massage/MessageLabel.text = text
	$MarginContainer/VBoxContainer/Massage/MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	$MarginContainer/VBoxContainer/Mcontrol.hide()
	show_message("Game Over")
	await $MessageTimer.timeout
	$MarginContainer/VBoxContainer/Massage/MessageLabel.text = "Come on live"
	$MarginContainer/VBoxContainer/Massage/MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$MarginContainer/VBoxContainer/Start/StartButton.show()


func update_score(score):
	$MarginContainer/VBoxContainer/Score/ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$MarginContainer/VBoxContainer/Start/StartButton.hide()
	start_game.emit()
	$MarginContainer/VBoxContainer/Mcontrol.show()



func _on_MessageTimer_timeout():
	$MarginContainer/VBoxContainer/Massage/MessageLabel.hide()
