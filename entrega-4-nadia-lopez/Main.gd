extends Node

func _ready():
	#Player se agrega un contenedor de projectiles
	$Player.set_projectile_container(self)
	$Torret.set_values($Player,self)
