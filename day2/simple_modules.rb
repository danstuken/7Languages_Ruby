#!/usr/bin/ruby

module DrinkSomething
   def drink_coffee
      puts "Hmm, roasted bean goodness"
   end

   def drink_tea
      puts "Ahhh, infused perfection"
   end

   def go_have_a_drink
      if likes_coffee?
         drink_coffee
      else
         drink_tea
      end
   end
end


class OverworkedPerson
   include DrinkSomething

   attr :coffee_drinker

   def initialize(likes_coffee)
      @coffee_drinker = likes_coffee
   end

   def likes_coffee?
      @coffee_drinker
   end
end

coffe_worker = OverworkedPerson.new(true)
coffe_worker.go_have_a_drink

tea_worker = OverworkedPerson.new(false)
tea_worker.go_have_a_drink
