extends Node2D

@export var scenes: Array[PackedScene]

var random_scenes = RandomNumberGenerator.new()
var selected_scene_index = 0

func _on_timer_timeout():
		random_scenes.randomize()
		selected_scene_index = random_scenes.randf_range(0, scenes.size())
		var _tmp = scenes[selected_scene_index].instantiate()
		add_child(_tmp)

func _on_spawner_timer_timeout():
	var spawner_1 = random_scenes
	add_child(spawner_1)
