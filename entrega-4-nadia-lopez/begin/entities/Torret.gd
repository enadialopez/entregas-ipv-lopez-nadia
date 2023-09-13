extends Sprite

export (PackedScene) var projectile_scene:PackedScene

onready var fire_position:Position2D = $FirePoition

var projectile_container:Node

var player

func set_values(player, projectile_container):
	self.player = player
	self.projectile_container = projectile_container
	$Timer.start()


func _on_Timer_timeout():
	fire()
	
func fire():
	var projectile:Projectil = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (fire_position.global_position - global_position).normalized())
	projectile.connect("delete_requested", self, "_en_projetile_delete_requested")
	
func _on_projectile_delete_requested(projectile):
	projectile.container.remove_child(projectile)
	projectile.queue_free()
