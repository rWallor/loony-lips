extends Control

var player_words = []
var current_story ={ "promts" : ["Name", "a Movie", "a adjective"],
		"story" : "Once upon a time %s watched %s and thought it was the %s movie of the past two decades."
		}

onready var player_text = $VBoxContainer/HBoxContainer/PlayerText
onready var display_text = $VBoxContainer/DisplayText

func _ready() -> void:
	display_text.text = "Welcome to Loony Lips! We´re going to tell a Story and have a wonderful Time. "
	check_player_words_length()
	player_text.grab_focus()

#if LineEdit entered a Input.
func _on_LineEdit_text_entered(new_text: String) -> void:
	add_to_player_words()
	
# if Texturebutton pressed.
func _on_TextureButton_pressed() -> void:
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
	
	
func add_to_player_words():
	player_words.append(player_text.text)
	display_text.text = ""
	player_text.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()
	

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()
	
	
func tell_story():
	display_text.text = current_story.story % player_words

  
func prompt_player():
	display_text.text += "May I have " + current_story.prompts[player_words.size()] + ", Please?"


func end_game():
	player_text.queue_free()
	tell_story()
	change_label_text()


func change_label_text():
	$VBoxContainer/HBoxContainer/Label.text = "Try again."
	
