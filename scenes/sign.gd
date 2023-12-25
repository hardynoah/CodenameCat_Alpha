extends Sprite2D

@export var text : String

@onready var area2d = $Area2D
@onready var signText = $SignText

var interactingWith : bool = false
var wasInArea : bool = false

func _process(_delta):
	var collisions = area2d.get_overlapping_bodies()
	var playerInArea = false
	for i in len(collisions):
		if (area2d.get_overlapping_bodies()[i].has_method("player")):
			playerInArea = true
	if (playerInArea):
		wasInArea = true
		if (Input.is_action_just_pressed("e")):
			if (!interactingWith):
				signText.text = text
				interactingWith = true
			else:
				signText.text = ''
				interactingWith = false
	elif wasInArea:
			signText.text = ''
			interactingWith = false
	playerInArea = false
