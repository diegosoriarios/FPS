extends KinematicBody

onready var raycast = $RayCast

var speed = 3
onready var player = get_node("/root/World/Player")
var saw_player = false

func _physics_process(delta):
	if saw_player:
		var to_player = translation.direction_to(player.translation)
		move_and_slide(to_player * speed)
	
func _process(delta):
	if raycast.is_colliding():
		var object = raycast.get_collider()
		print(object.get_name())
		saw_player = true
	else:
		saw_player = false