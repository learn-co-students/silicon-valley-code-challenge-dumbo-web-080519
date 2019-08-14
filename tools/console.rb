require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# I don't really know what domain, type of investment, etc.. mean in the investment world in real life so I just used any values that I thought would make as much sense as possible and passed them as arguments, just for the sake of testing the codes.

su1 = Startup.new("Nvidia", "Joe", "NY")
su2 = Startup.new("AMD", "Jason", "NJ")
su3 = Startup.new("Sony", "Jordan", "CA")

vc1 = VentureCapitalist.new("Josh", 10000)
vc2 = VentureCapitalist.new("James", 5000)
vc3 = VentureCapitalist.new("Johnny", 10000000)

fr1 = FundingRound.new(su1, vc1, "cash", 100)
fr2 = FundingRound.new(su1, vc2, "check", 500)
fr3 = FundingRound.new(su3, vc1, "credit", 300)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line