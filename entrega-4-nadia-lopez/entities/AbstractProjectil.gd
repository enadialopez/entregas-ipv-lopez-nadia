extends Sprite


class_name Projectile

signal delete_requested(projectile)

export (float) var speed 

var direction:Vector2

func _ready():
	set_physics_process(false)

#el proyectil empieza en la posicion donde se haga click
func set_starting_values(starting_position:Vector2, direction:Vector2):
	global_position = starting_position
	self.direction = direction
	set_physics_process(true)
	$Timer.start()

func _physics_process(delta):
	position += direction*speed*delta

func _on_Timer_timeout():
	emit_signal("delete_requested", self)
