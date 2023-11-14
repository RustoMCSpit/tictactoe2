extends Node2D

var gValue = Global.gamemode # Declare and initialize gValue
var turns_played
var cells
var winner
var occupiedCells = []
var inoccupiedCells = []

# Called when the node enters the scene tree for the first time.
func _ready():
	turns_played = 0
	cells = $Grid/GridCells.get_children()
	for cell in cells:
		cell.value = 0
	for cell in cells:
			if cell.value == 0:  
				inoccupiedCells.append(cell)
	print("The value of GridCell1 is ", cells[0].value)
	# listen for clicks
	for cell in cells:
		cell.cell_clicked.connect(HumanMove)
	winner = 0 # no one has won yet
	
	ChosenMode()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"""
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print (event.position)
"""

func CheckWin():
	var row1 = cells[0].value + cells[1].value + cells[2].value
	var row2 = cells[3].value + cells[4].value + cells[5].value
	var row3 = cells[6].value + cells[7].value + cells[8].value

	var col1 = cells[0].value + cells[3].value + cells[6].value
	var col2 = cells[1].value + cells[4].value + cells[7].value
	var col3 = cells[2].value + cells[5].value + cells[8].value

	var diag1 = cells[0].value + cells[4].value + cells[8].value
	var diag2 = cells[2].value + cells[4].value + cells[6].value

	var lines = [row1, row2, row3, col1, col2, col3, diag1, diag2]
	for line in lines:
		if line >= 3:
			winner = 1
			return true
		elif line <= -3:
			winner = -1
			return true
		else:
			winner = 0
	return false
	#Validate if turn is still possible, if not - return true and then declare winner. If yes, return false

func CheckDraw():
	if turns_played >= 9:
		return true
	else:
		return false

func HumanMove(cell):
	if CheckWin() == false:
		if CheckDraw() == false:
			inoccupiedCells = []
			for item in cells:
					if item.value == 0:  
						inoccupiedCells.append(item)
					if item.value != 0:  
						inoccupiedCells.remove_at(cells.find(item))
			print (inoccupiedCells)
			print("Human")
			cell.setX()
			turns_played += 1
			occupiedCells.append(cell)
			NPCMove()
			# Pick an unchosen cell if CheckEnd returns true 

func HumanMoveTwo(cell):
	if CheckWin() == false:
		if CheckDraw() == false:
			inoccupiedCells = []
			for item in cells:
					if item.value == 0:  
						inoccupiedCells.append(item)
					if item.value != 0:  
						inoccupiedCells.remove_at(cells.find(item))
			print (inoccupiedCells)
			print("Human")
			cell.setO()
			turns_played += 1
			occupiedCells.append(cell)
			NPCMove()
			# Pick an unchosen cell if CheckEnd returns true 

func NPCMove():
	if CheckWin() == false:
		if CheckDraw() == false:
			print("NPC")
			inoccupiedCells = []
			for item in cells:
				print(item.value)
			for item in cells:
				if item.value == 0:  
					inoccupiedCells.append(item)
				if item.value != 0:  
					inoccupiedCells.remove_at(cells.find(item))
					print("Unoccupied")
					print(len(inoccupiedCells))  
			var randomIndex = randi_range(0, len(inoccupiedCells))  # Generate a random index within the array size
			var randomItem = inoccupiedCells[randomIndex]  # Access the element at the random index
			print("NPC")
			randomItem.setO()
			turns_played += 1
			occupiedCells.append(randomItem)

func NPCMoveTwo():
	if CheckWin() == false:
		if CheckDraw() == false:
			print("NPC")
			inoccupiedCells = []
			for item in cells:
				print(item.value)
			for item in cells:
				if item.value == 0:  
					inoccupiedCells.append(item)
				if item.value != 0:  
					inoccupiedCells.remove_at(cells.find(item))
					print("Unoccupied")
					print(len(inoccupiedCells))  
			var randomIndex = randi_range(0, len(inoccupiedCells))  # Generate a random index within the array size
			var randomItem = inoccupiedCells[randomIndex]  # Access the element at the random index
			print("NPC")
			randomItem.setX()
			turns_played += 1
			occupiedCells.append(randomItem)

func SinglePlayer():
	pass
	# One HumanMove, One NPCMove

func MultiPlayer():
	pass
	# Two HumanMoves
	
func Simulation():
	while CheckWin() == false:
		if CheckDraw() == false:
			if turns_played % 2 == 0:
				NPCMove()
			else:
				NPCMoveTwo()
	#Two NPCMoves
 
func ChosenMode():
	match Global.gamemode:
		0:
			print ("Welcome to Single Player")
			SinglePlayer()
		1:
			print ("Welcome to Multi-Player")
			MultiPlayer()
		2:
			print ("Welcome to Simulation")
			Simulation()
