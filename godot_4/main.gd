extends Control

var today

func _ready():
	today = get_date()
	update_time()
	update_date()
	
func get_date() -> Dictionary:
	return Time.get_date_dict_from_system()
	
func get_week() -> int:
	return today.weekday
	
func update_week() -> void:
	var week = get_week()
	if week == 0:
		$Grid/WeekBlock.value = 7
	else:
		$Grid/WeekBlock.value = week
		
func get_day() -> int:
	return today.day
	
func update_month() -> void:
	var day = get_day()
	$Grid/MonthBar.value = day
	$Grid/Days.text = str(day)
	
func update_date() -> void:
	update_week()
	update_month()
	
func get_time() -> Dictionary:
	return Time.get_time_dict_from_system()
	
func update_time() -> void:
	var minute = get_time().minute
	var hour = get_time().hour
	if hour > 12:
		hour = hour - 12
	elif hour == 0:
		$Grid/MinuteBar/HourText.text = "12"
		update_date()
	else:
		$Grid/MinuteBar.value = minute
		$Grid/MinuteBar/HourText.text = str(hour)

func _on_timer_timeout():
	update_time()
