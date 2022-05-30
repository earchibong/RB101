=begin
Write a program that reads the content of a text file and then prints the 
longest sentence in the file based on number of words. 

Sentences may end with periods (.), exclamation points (!), or question marks (?). 
Any sequence of characters that are not spaces or sentence-ending characters 
should be treated as a word. 

You should also print the number of words in the longest sentence.
=end

string = File.read('text.txt')
sentences = string.split(/\.|\?|!/)
longest_sentence = ' '
sentences.each do |sentence|
  if sentence.size > longest_sentence.size
    longest_sentence = sentence
  end
end

words = longest_sentence.strip.split.size
puts " longest_sentence is #{longest_sentence}"
puts "it has #{words} words."