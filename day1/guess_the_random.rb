#!/usr/bin/ruby
#
#Dan Kendall 06/2011
#
#guess_the_random.rb
#

mySecret = rand(50)
guessCount = 0
puts "Guess the number (between 0 and 50) I'm thinking off!"

guess = "blah"
correctionMessageRoot = 'Bad luck. You were wrong, please try again. Hint: go '
goHigherHint = 'higher'
goLowerHint = 'lower'

guessIsNotCorrect = true
while(guessIsNotCorrect)

   guessIsNotANumber = true
   while(guessIsNotANumber)
      guess = gets
      guessIsNotANumber = !(guess =~ /^[0-9]+$/)
      if(guessIsNotANumber)
         puts "Please guess with numbers only"
      end
   end

   guessCount = guessCount + 1
   guessToTest = guess.to_i
   
   if(guessToTest == mySecret)
      guessIsNotCorrect = false
   else
      if(guessToTest < mySecret)
         puts correctionMessageRoot + goHigherHint
      else
         puts correctionMessageRoot + goLowerHint
      end
   end

end

puts "Congratulations you guessed correctly that my secret was #{mySecret} in #{guessCount} attempts"
