extends Node2D

onready var tree = preload("res://Scenes/Objects/Tree.tscn")
func _ready():
	$HUD/MaxHP.frame = Player.level - 1
	$HUD/MaxHP/HP.frame = Player.hp + 21
	
	$HUD/MaxXP.frame = Player.level - 1
	$HUD/MaxXP/XP.frame = Player.xp + 15
	
	gen_overworld()
func gen_overworld():
	for y in 45:
		for x in 43:
			randomize()
			if randi() % 100 > 80:
				$Objects/Overworld.set_cell(x-21,y-22,0,false,false,false,Vector2(randi() % 3, 0))
			else:
				$Objects/Overworld.set_cell(x-21,y-22,0,false,false,false,Vector2(2, 0))
			randomize()
			if randi() % 100 > 95:
				var i = tree.instance()
				i.position = Vector2((x-21)*8, (y-21)*8)
				$Objects.add_child(i)
				
