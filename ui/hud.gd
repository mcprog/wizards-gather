class_name HUD extends Control

@onready var unit_panel_1: UnitPanel = $HBoxContainer/UnitPanel1
@onready var unit_panel_2: UnitPanel = $HBoxContainer/UnitPanel2
@onready var unit_panel_3: UnitPanel = $HBoxContainer/UnitPanel3
@onready var unit_panel_4: UnitPanel = $HBoxContainer/UnitPanel4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func prepare(unit1: UnitHolder.UnitType, unit2: UnitHolder.UnitType, unit3: UnitHolder.UnitType, unit4: UnitHolder.UnitType):
	if unit1 == UnitHolder.UnitType.NONE:
		return
	unit_panel_1.show()
	unit_panel_1.prepare(UnitHolder.get_unit_name(unit1))
	if unit2 == UnitHolder.UnitType.NONE:
		return
	unit_panel_2.show()
	print_debug("unit 2 panel active")
	unit_panel_2.prepare(UnitHolder.get_unit_name(unit2))
	if unit3 == UnitHolder.UnitType.NONE:
		return
	unit_panel_3.show()
	unit_panel_3.prepare(UnitHolder.get_unit_name(unit3))
	if unit4 == UnitHolder.UnitType.NONE:
		return
	unit_panel_4.show()
	unit_panel_4.prepare(UnitHolder.get_unit_name(unit4))

func update_panel(unit, panel: UnitPanel):
	assert(unit.has_method("get_stats"), "Minions must have required method: get_stats()")
	var unit_stats = unit.get_stats()
	if abs(panel.mana_progress_bar.value - unit_stats[9]) > Constants.E:
		panel.set_values(unit_stats[1], unit_stats[0], unit_stats[4], unit_stats[5], unit_stats[6], unit_stats[10], unit_stats[7], unit_stats[8])

func update(unit1, unit2, unit3, unit4):
	if not unit1:
		return
	update_panel(unit1, unit_panel_1)
	if not unit2:
		return
	update_panel(unit2, unit_panel_2)
	if not unit3:
		return
	update_panel(unit3, unit_panel_3)
	if not unit4:
		return
	update_panel(unit4, unit_panel_4)
