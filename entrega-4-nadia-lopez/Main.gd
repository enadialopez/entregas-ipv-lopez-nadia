extends Node

func _ready():
	$Player.set_projectile_container(self)
	$Torret.set_value($Player,self)
