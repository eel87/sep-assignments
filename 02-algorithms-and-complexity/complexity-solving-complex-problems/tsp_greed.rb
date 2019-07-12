def neighbors(current_city)
	cities_list = ["chicago", "atlanta", "minneapolis", "denver", "la"]	
	return cities_list.select { |city| city != current_city }
end

def find_distance(city1, city2)
	cities_distances = [
										 [0, 715, 571, 1002, 2015], 
									 	 [715, 0, 1287, 1402, 2182], 
										 [571, 1287, 0, 914, 1927], 
										 [1002, 1402, 914, 0, 1017],
										 [2015, 2182, 1927, 1017, 0]
										 ]

	if city1 == "chicago" 
		city1 = 0
	elsif city1 == "atlanta"
		city1 = 1
	elsif city1 == "minneapolis"
		city1 = 2
	elsif city1 == "denver"
		city1 = 3
	elsif city1 == "la"
		city1 = 4
	else
		return "#{city1} is not it our database."
	end
	
	if city2 == "chicago" 
		city2 = 0
	elsif city2 == "atlanta"
		city2 = 1
	elsif city2 == "minneapolis"
		city2 = 2
	elsif city2 == "denver"
		city2 = 3
	elsif city2 == "la"
		city2 = 4
	else
		return "#{city2} is not it our database."
	end

	cities_distances[city1][city2]
end

def nearest_neighbor(current_city)
	neighbor_cities = neighbors(current_city)
	nearest_neighbor = neighbor_cities[0]
	visited_list = []

	neighbor_cities.each do |current_neighbor|
		current_neighbor_distance = find_distance(current_neighbor, current_city)
		nearest_neighbor_distance = find_distance(nearest_neighbor, current_city)

		if visited_list.include?(current_neighbor) == false && current_neighbor_distance < nearest_neighbor_distance
			nearest_neighbor = current_neighbor
		end
		visited_list << nearest_neighbor
	end
	return nearest_neighbor
end


# For the traveling salesman problem, nearest possible neighbor works by starting at the first city and moving to the city that is the nearest. It keeps a list of cities that you've visited and repeats this process until all the cities have been visited. Let's look at the pseudocode to implement nearest possible neighbor:

# DEF nearest_possible_neighbor(current_city)
#   SET neighbor_cities TO current_city.neighbors
#   SET nearest_neighbor TO first element in neighbor_cities

#   FOR current_neighbor IN neighbor_cities
#     IF current_neighbor.visited IS FALSE AND current_neighbor.distance < nearest_neighbor.distance
#       ASSIGN nearest_neighbor TO current_neighbor
#     END IF
#   END FOR
#   RETURN nearest_neighbor
# END DEF
# What is this greedy heuristic doing? 

# It's given a city and loops through the neighbors of the starting city then returns the neighbor that is the closest in terms of distance. This is only the basic nearest neighbor calculation; it loops through all neighbors of a city, and returns the closest neighbor that has not yet been visited. The method or class using this calculation will need to loop through all cities until they have all been visited.

# cities = Cities.new(["Chicago","Atlanta","Minnesota", "Denver", "Los Angeles", "Sunnydale", "Pawnee", "Gotham City"])

# print find_distance("denver", "la")
print nearest_neighbor("denver")
puts "\n"
print nearest_neighbor("minneapolis")
puts "\n"
print nearest_neighbor("la")
puts "\n"
print nearest_neighbor("chicago")
puts "\n"
print nearest_neighbor("atlanta")
puts "\n"