
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
      # adds unigram to array
      ngram_array << word_array[index]
      # adds bigram to array if next element exists
      # using double bang to turn 'truthy nils' into false
      if !!word_array[index+1]
        ngram_array << word_array.slice(index,2).join(" ")
      end
      # adds trigram to array if next element exists
      if !!word_array[index+2]
        ngram_array << word_array.slice(index,3).join(" ")
      end
      index += 1
    end
    ngram_array
end

# tests

def print_test_results(name, input, expectation)
  result = generate_ngram(input)
  puts name
  if result == expectation
    puts "  Result: Passed"
  else
    puts "  Result: Failed"
  end
  puts "  Input: \"#{input}\""
  print "  Output: "
  p result
  puts "\n"
end

print_test_results("Charlie Test",
                   "Make a killer impression.",
                   ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression", "killer", "killer impression", "impression"])

print_test_results("Complex Punctuation Test",
                   "Make: a, killer; impression!",
                   ["Make", "Make a", "Make a killer", "a", "a killer", "a killer impression", "killer", "killer impression", "impression"])

print_test_results("Apostrophe Test",
                   "Make's a killer impression!",
                   ["Make's", "Make's a", "Make's a killer", "a", "a killer", "a killer impression", "killer", "killer impression", "impression"])

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