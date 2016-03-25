
def generate_ngram(string)
  # regex looks for collections of letters containing apostrophes
  # OR collections of letters
  word_array = string.scan(/\w+'\w+|\w+/)
  return_ngram_array(word_array)
end

def return_ngram_array(word_array)
    ngram_array = []
    index = 0
    until index == word_array.length
      # adds unigram to output
      ngram_array << word_array[index]
      # adds bigram to output if next element exists
      # using double bang to turn 'truthy nils' into false
      if !!word_array[index+1]
        ngram_array << word_array.slice(index,2).join(" ")
      end
      # adds trigram to output if next element exists
      if !!word_array[index+2]
        ngram_array << word_array.slice(index,3).join(" ")
      end
      index += 1
    end
    ngram_array
end

# tests

if generate_ngram("Make a killer impression.") == ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression", "killer", "killer impression", "impression"]
  p "Charlie Test Passed"
else
  p "Charlie Test Failed"
end

if generate_ngram("Make: a, killer; impression!") == ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression", "killer", "killer impression", "impression"]
  p "Complex Punctuation Test Passed"
else
  p "Complex Punctuation Test Failed"
end

if generate_ngram("Make's a killer impression!") == ["Make's", "Make's a", "Make's a killer", "a", "a killer", "a killer impression", "killer", "killer impression", "impression"]
  p "Apostrophe Test Passed"
else
  p "Apostrophe Test Failed"
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