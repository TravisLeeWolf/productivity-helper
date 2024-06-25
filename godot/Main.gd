extends Control

var today
# Add function to determine the number of day for the current month
# Including leap year algorithm
# For now just use 30 days

func _ready() -> void:
	today = Time.get_date_dict_from_system()
	print(today)
	update_weekday_view(get_week())
	update_minute_view(get_minute())
	update_day_view(get_day())
	

func get_minute() -> int:
	var time = Time.get_time_string_from_system().split(":")
	return int(time[1])
	
func update_minute_view(minute) -> void:
	$Stack/Minute.value = minute

func _on_Timer_timeout() -> void:
	update_minute_view(get_minute())
	
func get_week() -> int:
	return today.weekday
	
func update_weekday_view(week) -> void:
	if week == 0:
		$Stack/Week.value = 7
	else:
		$Stack/Week.value = week
		
func get_day() -> int:
	return today.day
	
func update_day_view(day) -> void:
	$Stack/Day.value = day
