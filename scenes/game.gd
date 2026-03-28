class_name Game extends Node2D

@export_subgroup("Nodes")
@export var unit_holder: UnitHolder
@export var hud: HUD

@export_subgroup("Settings")
@export var starter_units: Array[PackedScene]

# @onready var wand_cursor: WandCursor = $WandCursor
var unit_holder_ready = false
var hud_ready = false
var hud_prepared = false

func _process(delta: float) -> void:
	if unit_holder_ready and hud_ready and not hud_prepared:
		print_debug("Ready to prepare hud")
		hud.prepare(unit_holder.unit1_type, unit_holder.unit2_type, unit_holder.unit3_type, unit_holder.unit4_type)
		hud_prepared = true
	hud.update(unit_holder.unit1, unit_holder.unit2, unit_holder.unit3, unit_holder.unit4)
func _on_unit_holder_setup_complete() -> void:
	unit_holder_ready = true


func _on_hud_ready() -> void:
	hud_ready = true
