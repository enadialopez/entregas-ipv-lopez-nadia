extends Sprite
#posicion de disparo
onready var fire_position:Position2D = $FirePosition
#escena
export (PackedScene) var projectile_scene:PackedScene

var projectile_container:Node

func fire():
	#instanciamos la escena
	var projectile_instance:Projectile = projectile_scene.instance()
	#el contenedor de proyectiles se lo agrega como hijo a proyectil
	projectile_container.add_child(projectile_instance)
	#le indicamos donde empieza
	projectile_instance.set_starting_values(fire_position.global_position, (fire_position.position.normalized())
	projectile_instance.connect("delete_requested", self, "_on_projetile_delete_requested")

func _on_projectile_delete_requested(projectile):
	projectile.container.remove_child(projectile)
	projectile.queue_free()
