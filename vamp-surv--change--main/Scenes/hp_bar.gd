extends ProgressBar

onready var character = Node2D() # get it somewhere

func _ready():
	character.connect("damaged", self, "_on_character_damage_taken")
	

 func _on_character_damage_taken(impact):
	value = CharacterBody2D.hp


func _on_node_2d_damaged(by: Variant) -> void:
	pass # Replace with function body.
