# Create a method that takes an array as a parameter. Within that method, try calling methods that do not mutate the caller. 

def not_mutate_method arr
  arr.sort
end

batman_characters = ["Batman", "Robin", "Joker", "Alfred", "Bruce", "Bane", "Catwoman"]

puts "\n"
puts "This is the array that our 'not_mutate_method' returns:"
puts "#{not_mutate_method(batman_characters)}"

# How does that affect the array outside of the method? 
puts "\n"
puts "This is how the array looks after the method was called:"
puts "#{batman_characters}"

# What about when you call a method that mutates the caller within the method?
puts "\n"

def mutate_method arr
  arr.sort!
end

puts "This is the array that our 'mutate_method' returns:"
puts "#{mutate_method(batman_characters)}"

puts "\n"

puts "This is how the array looks after the method is called:"
puts "#{batman_characters}"