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

def generate_ngram(string)
  initial_array = string.split(" ")
  counter = 0
  until counter == initial_array.length - 1
    return_ngram_elements(initial_array,counter)
    counter+=1
  end
end

def return_ngram_elements(array,counter)
    output_array = []
    # adds unigram to output
    output_array << array[counter]
    # adds bigram to output if next element exists
    if !next_element_nil?(array[counter+1])
      output_array << array[counter]+" "+array[counter+1]
    end
    # adds trigram to output if next element exists
    if !next_element_nil?(array[counter+2]
      output_array << array[counter]+" "+array[counter+1]+" "+array[counter+2]
    end
end

def next_element_nil?(element)
  element == nil
end