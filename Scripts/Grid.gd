extends Node2D

var all_dots:Array = []
var selected = null
var dot_moved = null
var dir_list:Array = [[-1,0],[0,1],[1,0],[0,-1]]
var touched:Array
var offset = 100
export (int) var width
export (int) var height

onready var x_start = position.x - 335
onready var y_start = position.y

onready var possible_dot = preload("res://Scene/Dots.tscn")
onready var move_timer = Timer.new()

onready var restructing = Timer.new()
onready var destroying = Timer.new()
signal matche_happend(color, col)

"------------------- Начало -------------------"

func _ready():
	randomize()
	all_dots = make_void_array()
	
	move_timer.set_one_shot(true)
	move_timer.set_wait_time(1)
	move_timer.connect("timeout",self,"after_move")
	
	destroying.set_one_shot(true)
	destroying.set_wait_time(0.35)
	destroying.connect("timeout",self,"after_move")	
	add_child(move_timer)
	add_child(destroying)
	
	fill_grid()


"------------------- Блок inline функций -------------------"

func grid_to_pixel(column, row):
	var new_x = offset * column
	var new_y = offset * row
	return Vector2(new_x, new_y)

func pixel_to_grid(pixel_x,pixel_y):
	var new_x = round(pixel_x / offset)
	var new_y = round(pixel_y / offset)
	return Vector2(new_x, new_y)
	pass

func make_2d_array(value):
	var array = []
	for i in height:
		array.append([])
		for j in width:
			array[i].append(value)
	return array

func make_void_array() -> Array:
	for i in height:
		all_dots.append([])
		for j in width:
			all_dots[i].append(null)
	return all_dots

"------------------- Переделка грида -------------------"

# Начально заполнение грида
func fill_grid():
	for i in height:
		for j in width:
			var dot_obj = preload("res://Scene/Dots.tscn")
			var dot =  dot_obj.instance()
			var tmp =randi()%5
			dot._set_dot(tmp)
			all_dots[i][j] = dot
			dot.connect("pushed",self,"select_dot")
			var loops = 0
			while (is_any_matches(i, j) and loops < 100):
				tmp =randi()%5
				dot = dot_obj.instance()
				dot.connect("pushed",self,"select_dot", [dot])
				dot._set_dot(tmp)
				all_dots[i][j] = dot
				loops += 1
			add_child(dot)
			dot.rect_position = grid_to_pixel(j, i)
			
# Есть ли возможность запросить dot по коордиинатам (j, i)  
func is_avaliable(i:int, j:int) -> bool:
	if (i >= 0 and j >= 0) and (j < width and i < height):
		return all_dots[i][j] != null
	else:
		return false

# Возвращает количество Dot'ов в компоненте связности если в ней больше или равно 3 в ряд
func is_any_matches(i:int, j:int):
	var col = 0
	for course in range(2):
			var first = match3(i, j, course + 1)
			var second = match3(i, j, course + 3)
			if (first + second > 1):
				col += first + second
	return col

# Проверяет, собрались ли какие-то match3
# direction = 0 проверяет все направления
# если нет, то возвращает количество dot'ов такого же цвета в направлении (включая тот, от которого идем)
func match3(i:int, j:int, direction:int ) -> int: 
	if (!is_avaliable(i,j)):
		return 0
	direction-=1
	if is_avaliable(i + dir_list[direction][0], j + dir_list[direction][1]):
		if (all_dots[i][j].color == all_dots[i + dir_list[direction][0]][j + dir_list[direction][1]].color):
			return match3(i + dir_list[direction][0], j + dir_list[direction][1], direction+1) + 1
		else:
			return 0
	return 0

# Есть ли какие-то dot'ты, которые должны были быть убраны, но что-то не получилось
func is_any_matched_dot() -> bool:
	for i in height:
		for j in width:
			if (all_dots[i][j] != null):
				if (all_dots[i][j].matched):
					return true
	return false

#Находит лучший Dot для удления в компоненте связности
func max_match(comp:Array) -> Array:
	var max_col:int = -1
	var max_ind:Array
	for dot in comp:
		var tmp_col = is_any_matches(dot[0],dot[1])
		if (tmp_col > max_col):
			max_col = tmp_col
			max_ind = dot
	return max_ind

#Возвращает компоненту связности одного цвета в формате Array[[dot.y,dot.x],...]
func dfs(i:int, j:int) -> Array:
	var comp:Array = [i,j]
	touched[i][j] = true
	for course in dir_list:
		if (is_avaliable(i + course[0], j + course[1])):
			if (!touched[i + course[0]][j + course[1]] and all_dots[i][j].color == all_dots[i+course[0]][j+course[1]].color):
				comp += dfs(i + course[0], j + course[1])
	return comp

# Возвращает я
func rebuild_dfs(comp:Array) -> Array:
	var truly_comp = []
	for i in range(0,comp.size(),2):
		truly_comp.append([comp[i],comp[i+1]])
	return truly_comp

# Возвращает все лучшие для удаления точки
func find_all_matches() -> Array:
	var matched_dots:Array = []
	touched = make_2d_array(false)
	for i in height:
		for j in width:
			var comp = rebuild_dfs(dfs(i,j))
			var needed_dot = max_match(comp)
			if (is_any_matches(needed_dot[0],needed_dot[1]) and comp.size() > 1):
				matched_dots.append(max_match(comp))
	return matched_dots

#Отмечает все dot'ы, которые составляют match3
func match3_and_mark(i:int, j:int, direction:int = 0): 
	if (!is_avaliable(i,j)):
		return
	all_dots[i][j].matched = true
	if (!direction):
		for course in range(2):
			var first = match3(i , j, course + 1)
			var second = match3(i , j, course + 3)
			if (first >= 1 and second >= 1):
				match3_and_mark(i + dir_list[course][0], j + dir_list[course][1], course + 1)
				match3_and_mark(i + dir_list[course + 2][0], j + dir_list[course + 2][1], course + 3)
			elif (first > 1):
				match3_and_mark(i + dir_list[course][0], j + dir_list[course][1], course + 1)
			elif (second > 1):
				match3_and_mark(i + dir_list[course + 2][0], j + dir_list[course + 2][1], course + 3)
	else:
		direction -= 1
		if (is_avaliable(i + dir_list[direction][0],j + dir_list[direction][1])):
			if (all_dots[i][j].color == all_dots[i + dir_list[direction][0]][j + dir_list[direction][1]].color):
				return match3_and_mark( i + dir_list[direction][0], j + dir_list[direction][1], direction+1)
			else:
				return
	return

# Отмечает все нужные для удаления match3
func mark_matched_dot(needed_dots:Array):
	for dot in needed_dots:
		match3_and_mark(dot[0],dot[1])

#Отмечает все match3 в grid
func any_matches():
	mark_matched_dot(find_all_matches())

func post_fill_grid():
	var dot_obj = preload("res://Scene/Dots.tscn")
	for i in height:
		for j in width:
			if all_dots[height - i - 1][width - j - 1] == null:
				var dot = dot_obj.instance()
				dot._set_dot(randi()%5)
				dot.rect_position = grid_to_pixel(width - j - 1, height - i -1)
				dot.connect("pushed", self, "select_dot")
				all_dots[height - i - 1][width - j - 1] = dot
				add_child(dot)

"------------------- Позиция параши -------------------"

func _input(event):
	var course_x:int = 0
	var course_y:int = 0
	if selected != null:
		if event is InputEventKey and (event.scancode == KEY_W || event.scancode == KEY_UP):
			course_y = -1	
		if event is InputEventKey and (event.scancode == KEY_S || event.scancode == KEY_DOWN):
			course_y = 1
		if event is InputEventKey and (event.scancode == KEY_A || event.scancode == KEY_LEFT):
			course_x = -1
		if event is InputEventKey and (event.scancode == KEY_D || event.scancode == KEY_RIGHT):
			course_x = 1
		if course_x != 0 or course_y != 0:
			move_dot(Vector2(course_x, course_y))

func move_dot(course : Vector2):
	var pos_x:int = pixel_to_grid(selected.rect_position.x,selected.rect_position.y).x
	var pos_y:int = pixel_to_grid(selected.rect_position.x,selected.rect_position.y).y
	if (is_avaliable(pos_y + course.y,pos_x + course.x) and not move_timer.get_time_left() ):
		var tmp = grid_to_pixel(pos_x, pos_y)
		var tmp_obj = all_dots[pos_y + course.y][pos_x + course.x]
		all_dots[pos_y + course.y][pos_x + course.x].move(tmp)
		all_dots[pos_y + course.y][pos_x + course.x] = all_dots[pos_y][pos_x]
		selected.move(grid_to_pixel(pos_x + course.x,pos_y + course.y))
		all_dots[pos_y][pos_x] = tmp_obj
		dot_moved = tmp_obj
		move_timer.start(0)

func after_move():
	restruct_grid()

func love_matches():
	if (find_all_matches() != []):
		restruct_grid()

func restruct_grid():
	if (find_all_matches() != []):
		selected = null
		any_matches()
		for j in width:
			restruct_column(j)
		# wait for dim
		for j in width:
			popusc_column(j)
		post_fill_grid()
		move_timer.start(0)

func restruct_column(j):
	var end = -1
	for i in height:
		if (all_dots[i][j].matched):
			end = i
			all_dots[i][j].dim()
			remove_child(all_dots[i][j])
			all_dots[i][j] = null
		elif (end != -1):
			break

func popusc_column(j:int):
	var length:int = 0
	var start:int = 0
	for i in height:
		if (all_dots[i][j] == null):
			length+=1
		elif(length):
			break
		else:
			start = i+1

	if start == height:
		return

	for i in start:
		all_dots[start-1+length-i][j] = all_dots[start-1-i][j]
		all_dots[start-i-1][j].move(grid_to_pixel(j,start-1+length-i))

	for i in length:
		all_dots[i][j] = null

func select_dot(dot):
	selected = dot
