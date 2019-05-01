require_relative 'node'
require_relative 'graph'
require_relative 'find_kevin_bacon'

kevin_bacon = Node.new("Kevin Bacon")
james_mcavoy = Node.new('James McAvoy')
michael_fassbender = Node.new('Michael Fassbender') 
jennifer_lawrence = Node.new('Jennifer Lawrence') 
ryan_gosling = Node.new('Ryan Gosling') 
emma_stone = Node.new('Emma Stone') 
morgan_freeman = Node.new('Morgan Freeman') 
chris_pratt = Node.new('Chris Pratt') 
harrison_ford = Node.new('Harrison Ford')
tommy_lee_jones = Node.new('Tommy Lee Jones')
zoe_saldana = Node.new('Zoe Saldana')
bradley_cooper = Node.new('Bradley Cooper')
chris_pine = Node.new('Chris Pine')
simon_pegg = Node.new('Simon Pegg')
tom_cruise = Node.new('Tom Cruise')
jeremy_renner = Node.new('Jeremy Renner')
amy_adams = Node.new('Amy Adams')

kevin_bacon.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, jennifer_lawrence]

james_mcavoy.film_actor_hash['X-Men: First Class'] = [kevin_bacon, michael_fassbender, jennifer_lawrence]
michael_fassbender.film_actor_hash['X-Men: First Class'] = [james_mcavoy, kevin_bacon, jennifer_lawrence]
jennifer_lawrence.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, kevin_bacon]

james_mcavoy.film_actor_hash['Wanted'] = [morgan_freeman, chris_pratt]
morgan_freeman.film_actor_hash['Wanted'] = [james_mcavoy, chris_pratt]
chris_pratt.film_actor_hash['Wanted'] = [morgan_freeman, james_mcavoy]

harrison_ford.film_actor_hash['The Fugitive'] = [tommy_lee_jones]
tommy_lee_jones.film_actor_hash['The Fugitive'] = [harrison_ford]

ryan_gosling.film_actor_hash['Blade Runner: 2049'] = [harrison_ford]
harrison_ford.film_actor_hash['Blade Runner: 2049'] =[ryan_gosling]

kevin_bacon.film_actor_hash['Crazy, Stupid, Love'] = [ryan_gosling, emma_stone]
ryan_gosling.film_actor_hash['Crazy, Stupid, Love'] = [kevin_bacon, emma_stone]
emma_stone.film_actor_hash['Crazy, Stupid, Love'] = [ryan_gosling, kevin_bacon]

chris_pratt.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, bradley_cooper]
zoe_saldana.film_actor_hash['Guardians of the Galaxy'] = [chris_pratt, bradley_cooper]
bradley_cooper.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, chris_pratt]

simon_pegg.film_actor_hash['Mission Impossible: Ghost Protocol'] = [tom_cruise, jeremy_renner]
tom_cruise.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, jeremy_renner]
jeremy_renner.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, tom_cruise]

zoe_saldana.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, simon_pegg]
chris_pine.film_actor_hash['Star Trek: Into Darkness'] = [zoe_saldana, simon_pegg]
simon_pegg.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, zoe_saldana]

jeremy_renner.film_actor_hash['Arrival'] = [amy_adams]
amy_adams.film_actor_hash['Arrival'] = [jeremy_renner]

graph = Graph.new

graph.add_edge(kevin_bacon, james_mcavoy)
graph.add_edge(kevin_bacon, michael_fassbender)
graph.add_edge(kevin_bacon, jennifer_lawrence)
graph.add_edge(kevin_bacon, ryan_gosling)
graph.add_edge(kevin_bacon, emma_stone)
graph.add_edge(james_mcavoy, michael_fassbender)
graph.add_edge(james_mcavoy, jennifer_lawrence)
graph.add_edge(james_mcavoy, morgan_freeman)
graph.add_edge(james_mcavoy, chris_pratt)
graph.add_edge(michael_fassbender, jennifer_lawrence)
graph.add_edge(morgan_freeman, chris_pratt)
graph.add_edge(chris_pratt, zoe_saldana)
graph.add_edge(chris_pratt, bradley_cooper)
graph.add_edge(zoe_saldana, bradley_cooper)
graph.add_edge(simon_pegg, tom_cruise)
graph.add_edge(simon_pegg, jeremy_renner)
graph.add_edge(tom_cruise, jeremy_renner)
graph.add_edge(zoe_saldana, chris_pine)
graph.add_edge(zoe_saldana, simon_pegg)
graph.add_edge(chris_pine, simon_pegg)
graph.add_edge(jeremy_renner, amy_adams)
graph.add_edge(harrison_ford, tommy_lee_jones)
graph.add_edge(harrison_ford, ryan_gosling)
graph.add_edge(ryan_gosling, emma_stone)

puts "Harrison Ford -> Kevin Bacon"
find_kevin_bacon = FindKevinBacon.new(graph, harrison_ford)
find_kevin_bacon.shortest_path_to(kevin_bacon)

puts "\nJennifer Lawrence -> Kevin Bacon"
find_kevin_bacon2 = FindKevinBacon.new(graph, jennifer_lawrence)
find_kevin_bacon2.shortest_path_to(kevin_bacon)

puts "\nTom Cruise -> Kevin Bacon"
find_kevin_bacon3 = FindKevinBacon.new(graph, tom_cruise)
find_kevin_bacon3.shortest_path_to(kevin_bacon)