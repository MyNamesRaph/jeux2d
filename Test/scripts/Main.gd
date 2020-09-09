extends Node


var supposition = 500
var minimum = 0
var maximum = 1000
var fin = false
var message_intro = []
var rng = RandomNumberGenerator.new()
var isInit = false
var rand
# Called when the node enters the scene tree for the first time.
func _ready():
	message_intro.append("-------------------------")
	message_intro.append("Bonjour, je suis le devin des nombres!")
	message_intro.append("-------------------------")
	
	for i in message_intro :
		print(i)
		
	var rand = int(rng.randf_range(minimum, maximum))
	print("Je vais deviner le nombre auqeul tu penses entre " +  str(minimum) + " et " + str(maximum) + " !")
	_guess(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_essai(Input)


func _essai(input) :
	if input.is_action_just_pressed("nombrePlusHaut") :
		print("Votre nombre est plus haut")
		_guess(true)
	elif input.is_action_just_pressed("nombrePlusBas") :
		print("Votre nombre est plus bas")
		_guess(false)
	elif input.is_action_just_pressed("nombreBon") :
		print("J'ai deviné votre nombre")
		_fin()
		
func _fin() :
	get_tree().reload_current_scene();
	
	
func _guess(isBigger) :
	if isInit :
		if isBigger :
			minimum = rand+1
		else :
			maximum = rand-1
	rand = int(rng.randf_range(minimum, maximum))
	print("Je vais deviner le nombre auqeul tu penses entre " +  str(minimum) + " et " + str(maximum) + " !")
	print("Votre nombre est-il " + str(rand) + " ?")
	isInit = true
