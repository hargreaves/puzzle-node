### Bring in source file
source_text = File.read("input.txt")

### Split file by newline, put each line into 3 arrays

source_array = source_text.split("\n")
number_of_lines = source_array.length
number_of_factories = ((number_of_lines + 1) / 4)
# puts "there are #{number_of_factories} factories!"

factory = 0


while (factory <= number_of_factories - 1)


north_lasers = source_array[(factory *4) + 0].split("")
south_lasers = source_array[(factory *4) + 2].split("")
robot_start = source_array[(factory *4) + 1].split("")

### Find the position of the robot

conveyor_length = robot_start.length
robot_starting_position = 0

(0..conveyor_length).each do |i|
	if (robot_start[i] == "X")
		robot_starting_position = i
		break;
	end
end

# puts "The robot is at position #{robot_starting_position}"

### Send robot in each direction, add up hits

hits_west = 0
hits_east = 0

### Go West

robot_position = robot_starting_position
count = 0

while (robot_position >= 0)
	if (count % 2 == 0)
		if (north_lasers[robot_position] == "|") 
			hits_west += 1
		end
	else
		if (south_lasers[robot_position] == "|") 
			hits_west += 1
		end
	end
	count += 1
	robot_position -= 1
end
# puts "The robot will take #{hits_west} hits to the west!"


### Go East

robot_position = robot_starting_position
count = 0

while (robot_position <= conveyor_length)
	if (count % 2 == 0)
		if (north_lasers[robot_position] == "|") 
			hits_east += 1
			# puts "The robot was hit by north lasers at #{robot_position}, count #{count}"
		end
	else
		if (south_lasers[robot_position] == "|") 
			hits_east += 1
			# puts "The robot was hit by south lasers at #{robot_position}, count #{count}"
		end
	end
	count += 1
	robot_position += 1
end
# puts "The robot will take #{hits_east} hits to the east!"


### Make a decision

if (hits_west <= hits_east)
	puts "Go West in #{factory}"
else puts "Go East in #{factory}"
end


factory +=1
end
