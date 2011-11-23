#!/usr/bin/env ruby

# The items (values to make the biggest numbah), sum (answer, actually) and the triangle
items = []
sum = 0
striangle = <<TRIANGLE
3
7 4
2 4 6
8 5 9 3
TRIANGLE

# Transform this TRIANGLE shown above, into array(s)
# 
#    3
#   7 4     ==>   [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]
#  2 4 6
# 8 5 9 3
# 
triangle = striangle.split("\n").collect do |e|
	e.split(" ").collect do |n|
		n.to_i
	end.delete_if { |i| i == 0 }
end

# Add the first one to the sum
sum += triangle[0][0]

# Position of present number
pos = nil
row = triangle.size - 1

triangle.each do |i|
	max = triangle[row].max
	puts "#{triangle[row - 1][triangle[row].index(max)]} #{triangle[row - 1][triangle[row].index(max) - 1]} [#{row}]"
	row -= 1
end

#puts "yer answerrr be: #{sum}"
