extends Polygon2D
var firstElement
func calculate_polygon_area(vertices):
	var n = vertices.size()
	var area = 0.0
	
	for i in range(n):
		var vertex1 = vertices[i]
		var vertex2 = vertices[(i + 1) % n]
		area += (vertex1.x * vertex2.y - vertex2.x * vertex1.y)
	
	return abs(area) / 2.0
func filterVector2Array(array: PackedVector2Array) -> PackedVector2Array:
	var filteredArray: PackedVector2Array = []
	for i in range(array.size()):
		var isDuplicate = false
		var isTooClose = false
		var currentVector = array[i]
		for j in range(filteredArray.size()):
			var existingVector = filteredArray[j]
			# Check for duplicates
			if currentVector == existingVector:
				isDuplicate = true
				break
			# Check for proximity
			var distance = currentVector.distance_to(existingVector)
			if distance < 0.5:
				isTooClose = true
				break
		if !isDuplicate and !isTooClose:
			filteredArray.append(currentVector)
	return filteredArray
	

func point_in_polygon(x: float, y: float, PG: Array):
	var odd_nodes = false
	var j = PG.size() - 1

	for i in PG.size():
		if (PG[i].y < y and PG[j].y >= y) or (PG[j].y < y and PG[i].y >= y):
			if PG[i].x + (y - PG[i].y) / (PG[j].y - PG[i].y) * (PG[j].x - PG[i].x) < x:
				odd_nodes = !odd_nodes
		j = i

	return odd_nodes

func create_polygon_array(PG: Array, resolution: float = 0.5):
	var min_x = get_min_value(PG, "x")
	var max_x = get_max_value(PG, "x")
	var min_y = get_min_value(PG, "y")
	var max_y = get_max_value(PG, "y")

	var width = int((max_x - min_x) / resolution) + 1
	var height = int((max_y - min_y) / resolution) + 1

	var result = []
	var y = 0
	while y < height:
		result.append([])
		var x = 0
		while x < width:
			var real_x = x * resolution + min_x
			var real_y = y * resolution + min_y
			if point_in_polygon(real_x, real_y, PG):
				result[y].append("#")
			else:
				result[y].append(" ")
			x += 1
		y += 1

	return result

func get_min_value(array: Array, property: String):
	var min_value = float("inf")
	for item in array:
		if item[property] < min_value:
			min_value = item[property]
	return min_value

func get_max_value(array: Array, property: String):
	var max_value = float("-inf")
	for item in array:
		if item[property] > max_value:
			max_value = item[property]
	return max_value

func _input(_event):
	if !GB.bordersDefined:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			if GB.turn == "red":
				var polygonCopy = polygon + PackedVector2Array([get_local_mouse_position()])
				if polygon.is_empty():
					firstElement = PackedVector2Array([get_local_mouse_position()])
				if calculate_polygon_area(polygonCopy) < 100:
					polygon = polygon + PackedVector2Array([get_local_mouse_position()])
				polygon = filterVector2Array(polygon)
				GB.redCoverage = create_polygon_array(polygon)
