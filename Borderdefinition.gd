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
			if distance < 0.1:
				isTooClose = true
				break

		if !isDuplicate and !isTooClose:
			filteredArray.append(currentVector)

	return filteredArray


func _input(_event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var polygonCopy = polygon + PackedVector2Array([get_local_mouse_position()])
		if polygon.is_empty():
			firstElement = PackedVector2Array([get_local_mouse_position()])
		if calculate_polygon_area(polygonCopy) < 100:
			polygon = polygon + PackedVector2Array([get_local_mouse_position()])
		polygon = filterVector2Array(polygon)
