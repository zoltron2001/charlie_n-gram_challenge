
# Initial Solution

def generate_ngram(string)
  initial_array = string.split(" ")
  return_ngram_array(initial_array)
end

def return_ngram_array(array)
    output_array = []
    index = 0
    until index == array.length
      # adds unigram to output
      output_array << array[index]
      # adds bigram to output if next element exists
      # using double bang to turn 'truthy nils' into false
      if !!array[index+1]
        output_array << array.slice(index,2).join(" ")
      end
      # adds trigram to output if next element exists
      if !!array[index+2]
        output_array << array.slice(index,3).join(" ")
      end
      index += 1
    end
    output_array
end

# test

if generate_ngram("Make a killer impression.") == ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression.", "killer", "killer impression.", "impression."]
  p "Charlie Test Passed"
else
  p "Charlie Test Failed"
end

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