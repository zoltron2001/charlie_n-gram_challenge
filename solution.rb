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

# Initial Solution

def generate_ngram(string)
  initial_array = string.split(" ")
  output_array = []
  counter = 0
  until counter == initial_array.length
    # adds unigram to output
    output_array << initial_array[counter]
    # adds bigram to output if next element exists
    # using double bang to turn 'truthy nils' into false
    if !!initial_array[counter+1]
      output_array << initial_array[counter]+" "+initial_array[counter+1]
    end
    # adds trigram to output if next element exists
    if !!initial_array[counter+2]
      output_array << initial_array[counter]+" "+initial_array[counter+1]+" "+initial_array[counter+2]
    end
    counter += 1
  end
  output_array
end

# tests

if generate_ngram("Make a killer impression.") == ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression.", "killer", "killer impression.", "impression."]
  p "Charlie test Passed"
else
  p "Charlie test Failed"
end