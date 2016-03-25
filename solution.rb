=begin
Pseudocode

create n-grams from a string of text
N-grams are n-word sets like “Charlie rocks”

Write a program that
  takes a string of words
  returns a set of every sequential
    unigram
    bigram
    trigram.

"Make a killer impression."

=> ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression", "killer", "killer impression.", "impression"]

Requirements
* Generate a set of every possible sequential bigram from a string of text
* Keep performance & memory usage in mind
* Include tests

=end

# Naive Solution

def ngram_solver(string)
  initial_array = string.split(" ")
  output_array = []
  counter = 0
  until counter == intitial_array.length - 1
    output_array << initial_array[counter]
    output_array << initial_array[counter,counter+1].join(' ')
    output_array << initial_array[counter,counter+1,counter+2].join(' ')
    counter+=1
  end
end