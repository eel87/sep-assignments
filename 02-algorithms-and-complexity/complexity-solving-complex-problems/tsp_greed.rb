# Implement a solution in Ruby to the traveling salesman problem using the nearest neighbor heuristic

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

class Neighbors
  
  def initialize(cities)
    @cities = cities 
  end

  def nearest_neighbor(current_city)
    
  end

end