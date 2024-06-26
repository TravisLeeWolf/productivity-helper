extends Control

var today
# Add function to determine the number of day for the current month
# Including leap year algorithm
# For now just use 30 days

func _ready() -> void:
	today = Time.get_date_dict_from_system()
	print(today)
	update_weekday_view(get_week())
	update_time_views(get_time())
	update_day_view(get_day())
	

func get_time() -> Array:
	var time = Time.get_time_string_from_system().split(":")
	return time
	
func update_time_views(time) -> void:
	var hour
	if int(time[0]) > 12:
		hour = int(time[0]) - 12
	else:
		hour = time[0]
	$Stack/Minute/Hour.text = str(hour)
	$Stack/Minute.value = int(time[1])

func _on_Timer_timeout() -> void:
	update_time_views(get_time())
	
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
