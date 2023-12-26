extends Sprite2D

@onready var setDownSound = $SetDownSound

var player_in_area = false
var collected = false
var player = null

func _on_area_2d_body_entered(body):
	if body.name.match("Cat"):
		collected = true
		player = body
		player.powerUpState = 1

func _process(_delta):
	if collected:
		var direction = (player.dir * 2) - 1
		if (direction == -1):
			position = player.position + Vector2(-8, 5)
		elif (direction == 1):
			position = player.position + Vector2(8, 5)
		if Input.is_action_just_pressed("toss") and player.is_on_floor():
			setDownSound.play()
			collected = false
			position = position + Vector2(-direction * 50, 0)
