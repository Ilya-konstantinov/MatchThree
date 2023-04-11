extends Button

export (int) var color = 0
onready var timer = Timer.new()

onready var move_tween = $Tween
onready var anim = $Sprite
var color_path:Array = ["blue.svg", "green.svg", "pink.svg", "red.svg","yellow.svg"]
var anim_path:Array = ["Shield","Star","Skull","Heart", "Coin"]
signal die
signal pushed(dot)

var matched = false

var move_step_count = 100
var current_dim = 1
func _set_dot(color_got):
	$AnimatedSprite.play(anim_path[color_got])
	color = color_got
	pass

func _ready():
	pass
	
func move(target):
	move_tween.interpolate_property(self, "rect_position", rect_position, target, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	move_tween.start()
	pass

func dim():
	timer.connect("timeout",self,"da")
	timer.set_wait_time(0.01)
	add_child(timer)
	timer.start()
	
func da():
	anim.modulate = Color(1, 1, 1, current_dim)
	current_dim -= 0.01
	if current_dim <= 0:
		timer.stop()

func _on_Dots_button_down():
	emit_signal("pushed",self)
