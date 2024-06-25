extends Control

var today
# Add function to determine the number of day for the current month
# Including leap year algorithm
# For now just use 30 days

func _ready() -> void:
	today = Time.get_date_dict_from_system()
	get_minute()

func get_minute() -> String:
	var time = Time.get_time_string_from_system().split(":")
	return time[1]

func _on_Timer_timeout() -> void:
	print(get_minute())
