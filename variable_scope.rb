
# 1. Create a local variable and modify it at an inner scope (in between a do/end block). You can try

# a) re-assigning the variable to something else

local_variable = 4

3.times do
  local_variable += 1
  puts "local_variable is #{local_variable}"
end

puts "local_variable outside the block is #{local_variable}"

# b) call a method that doesn’t mutate the caller
local_variable = [3, 7, 9, 10, 12, 2, 4, 1, 2]
puts "local_variable is now #{local_variable}"

3.times do
  print local_variable.sort
end

puts "\nlocal_variable after the block has ended is #{local_variable}"

# c) call a method that mutates the caller.

1.times do
  print "local_variable insie the block is: #{local_variable.sort!}"
end

puts "\nlocal_variable after the block has ended is #{local_variable}"

# 2. Create a local variable at an inner scope (within a do/end block) and try to reference it in the outer scope. What happens when you have nested do/end blocks?
1.times do
  inner_variable = "hey!"
end

#puts "#{inner_variable}"

1.times do
  inner_variable = "this"
  puts "#{inner_variable}"
  1.times do
    inner_variable = "is"
    double_inner_var = "deep"
  end
  puts "#{inner_variable}"
  puts "#{double_inner_var}"
end

