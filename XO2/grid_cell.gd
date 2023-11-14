extends Area2D
var value
signal cell_clicked(cell)
const x_symbol = preload("res://assets/x.png")
const o_symbol = preload("res://assets/o.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		emit_signal("cell_clicked", self)

func setX():
	value = 1
	$CellSymbol.texture = x_symbol

func setO():
	value = -1
	$CellSymbol.texture = o_symbol

func setEmpty():
	value = 0
	$CellSymbol.texture = null
