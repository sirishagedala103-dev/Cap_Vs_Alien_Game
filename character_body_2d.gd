extends CharacterBody2D

@onready var alien: Area2D = get_node("../sirisha")


func _ready() -> void:
	alien.body_entered.connect(_on_alien_body_entered)


func _physics_process(_delta: float) -> void:
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400.0
	move_and_slide()


func _on_alien_body_entered(body: Node2D) -> void:
	if body == self:
		alien.queue_free()
