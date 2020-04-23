extends Control

var player_words = []
var story = "Once upon a time %s watched %s and thought it was the %s movie of the past two decades."
var prompts = ["Name", "a Movie", "a adjective"]

onready var player_text = $VBoxContainer/HBoxContainer/PlayerText
onready var display_text = $VBoxContainer/DisplayText

func _ready() -> void:
	display_text.text = "Welcome to Loony Lips! We´re going to tell a Story and have a wonderful Time. "
	check_player_words_length()

#if LineEdit entered a Input.
func _on_LineEdit_text_entered(new_text: String) -> void:
	add_to_player_words()
	
# if Texturebutton pressed.
func _on_TextureButton_pressed() -> void:
	add_to_player_words()
	
	
func add_to_player_words():
	player_words.append(player_text.text)
	display_text.text = ""
	player_text.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == prompts.size()
	

func check_player_words_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()
	
	
func tell_story():
	display_text.text = story % player_words


func prompt_player():
	display_text.text += "May I have " + prompts[player_words.size()] + ", Please?"
	
	
	
