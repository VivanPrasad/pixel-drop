extends Node2D

onready var tree = preload("res://Scenes/Objects/Tree.tscn")
onready var dark = preload("res://Scenes/Particles/Void.tscn")
func _ready():
	$HUD/MaxHP.frame = Player.level - 1
	$HUD/MaxHP/HP.frame = Player.hp + 21
	
	$HUD/MaxXP.frame = Player.level - 1
	$HUD/MaxXP/XP.frame = Player.xp + 15
	
	gen_overworld()

var occ = []
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
				i.position = Vector2((x-21)*8+4, (y-22)*8+5)
				$Objects.add_child(i)
				occ.append(Vector2(x-21,y-22))


func _on_Timer_timeout():
	var x = randi() % 43 - 21
	var y = randi() % 45 - 22
	if $Objects/Overworld.get_used_cells().has(0):
		while $Objects/Overworld.get_cell(x, y) != 0:
			randomize()
			x = randi() % 43 - 21
			y = randi() % 45 - 22
	if Vector2(x, y) in occ:
		for i in $Objects.get_children():
			if i.position == Vector2(x*8+4,y*8+5):
				i.queue_free()
	$Objects/Overworld.set_cell(x,y,1)
	var i = dark.instance()
	i.position = Vector2(x*8+4,y*8+5)
	$Objects.add_child(i)
	$Timer.start()
