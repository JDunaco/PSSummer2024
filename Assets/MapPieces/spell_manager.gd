extends Node2D



func _on_player_player_fired_spell(spell, position, _direction):
	add_child(spell)
	spell.global_position = position
