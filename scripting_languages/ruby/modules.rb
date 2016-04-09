# ruby modules

module Super_power
  def fly
      puts 'flying'
  end 
  
  def lazer
    puts 'lazzzzzer'
  end 
end


class Person
  include Super_power 
end


dude = Person.new

dude.fly # 'flying'
