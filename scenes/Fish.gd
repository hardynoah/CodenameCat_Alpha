extends Node2D

var player_in_area = false
var collected = false
var timerStarted = false
var startY = 0.0
var dir = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	startY = $FishSprite.position.y

func _process(_delta):
	if (player_in_area and !collected):
		print("got it!")
		collected = true
	$FishSprite.position.y += dir * 0.05
	if($FishSprite.position.y >= (startY + 5.0) or $FishSprite.position.y <= (startY - 5.0)):
		dir *= -1
		

func _physics_process(_delta):
	if (player_in_area):
		$FishSprite.position.y -= 20.0
		if !timerStarted:
			delete_fish()

func _on_collect_area_body_entered(body):
	if body.name.match("Cat"):
		player_in_area = true;

func delete_fish():
		$FishTimer.start()
		timerStarted = true

func _on_fish_timer_timeout():
	queue_free()
