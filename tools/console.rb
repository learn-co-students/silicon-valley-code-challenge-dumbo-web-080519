require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

matt = VentureCapitalist.new("Matt", 1000000)
sam = VentureCapitalist.new("Sam", 50)
rich = VentureCapitalist.new("Rich", 1000000000)

bobs = Startup.new("Bobs Burgers", "Bob", "Food")
cool_tech = Startup.new("Cool Tech", "Cool Guy", "Technology")

funding1 = FundingRound.new(bobs, matt, "type a", 100)
funding2 = FundingRound.new(bobs, sam, "type b", 20)
funding3 = FundingRound.new(cool_tech, matt, "type c", 5000)
funding4 = FundingRound.new(cool_tech, sam, "type d", 25)


#binding.pry
0 #leave this here to ensure binding.pry isn't the last line