extends Sprite

class_name Projectil

signal delete_requested(projectil)

export (float) var speed 

var dir:Vector2

func _ready():
	set_physics_process(false)
	
func set_starting_values(starting_position:Vector2, direction:Vector2):
	global_position = starting_position
	self.dir = direction
	$Timer.start()
	set_physics_process(true)

func _physics_process(delta):
	position += dir*speed*delta


func _on_Timer_timeout():
	emit_signal("delete_requested", self)
