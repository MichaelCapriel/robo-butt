extends VBoxContainer

@export var sceneToLoad : PackedScene

func _ready():
	pass 

func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_packed(sceneToLoad)
