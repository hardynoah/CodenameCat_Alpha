extends Area2D



func _process(_delta):
	var collisions = get_overlapping_bodies()
	for i in len(collisions):
		if (get_overlapping_bodies()[i].has_method("player")):
			if (Input.is_action_just_pressed("e")):
				print("poop")
