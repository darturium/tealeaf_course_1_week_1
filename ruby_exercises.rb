# Note: we're looking for Ruby commands for the below questions, not the actual answers, unless it's a question. 

# Hint: you can type "irb" in your terminal to get a Ruby console to test things out. For multi-line code, use an editor that can run Ruby code, or copy/paste into irb.

# Hint 2: you can refer to the Ruby doc for Array and Hash here: 

# http://www.ruby-doc.org/core-1.9.3/Array.html
# http://www.ruby-doc.org/core-1.9.3/Hash.html


# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
puts "\nEx. 1"
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |num| puts num }

# 2. Same as above, but only print out values greater than 5.
puts "\nEx. 2"
arr.each { |num| puts num if num > 5 }

# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.
puts "\nEx. 3"
new_arr = arr.select { |num| num.odd? }
puts new_arr

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.
puts "\nEx. 4"
arr << 11
puts arr
arr.unshift(0)
print "\n" 
puts arr

# 5. Get rid of "11". And append a "3".
puts "\nEx. 5"
arr.delete(11)
puts arr
arr << 3
print "\n"
puts arr

# 6. Get rid of duplicates without specifically removing any one value. 
puts "\nEx. 6"
puts arr.uniq

# 7. What's the major difference between an Array and a Hash?
puts "\nEx. 7"
puts "An Array is an integer-indexed collection of any object and a Hash is a dictionary-like collection which contains unique keys and value pairs"

# 8. Create a Hash using both Ruby 1.8 and 1.9 syntax.
puts "\nEx. 8"
ruby_18 = {:language => "Ruby",
           :os => "OS X",
           :browser => "Chrome"}

ruby_19 = {language: "Ruby",
           os: "OS X",
           browser: "Chrome"}

# Suppose you have a h = {a:1, b:2, c:3, d:4}

# 9. Get the value of key "b".
puts "\nEx. 9"
h = {a: 1, b: 2, c: 3, d: 4}

puts "There is no value for the key 'b' because all keys in this hash are symbols, 'b' is a string"

# 10. Add to this hash the key:value pair {e:5}
puts "\nEx. 10"
h[:e] = 5
puts h

# 13. Remove all key:value pairs whose value is less than 3.5
puts "\nEx. 11"
h.delete_if {|k, v| v < 3.5 }
puts h

# 14. Can hash values be arrays? Can you have an array of hashes? (give examples)
puts "\nEx. 14"

puts "Hash values can be in fact be arrays. Here is an example: "
array_in_hash = {key_1: [1, 2, 3, 4, 5],
                 key_2: [6, 7, 8, 9, 10]}

puts array_in_hash

puts "\nWe can also have an array of hashes, as in the following example: "
array_in_hash2 = {key_3: [11, 12, 13, 14, 15],
                 key_4: [16, 17, 18, 19, 20]}
puts "\n"
array_of_hashes = []
array_of_hashes << array_in_hash
array_of_hashes << array_in_hash2
puts array_of_hashes

# 15. Look at several Rails/Ruby online API sources and say which one your like best and why.
puts "\nEx. 15"
puts "The resource I like the best has to be www.ruby-doc.org because of great wealth of detailed documentation that is available for every single type of class and method in Ruby."