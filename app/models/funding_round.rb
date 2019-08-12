class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type.to_s
        if investment < 0
            raise "Cannot invest a negative amount."
        else
            @investment = investment.to_f
        end
        @@all << self
    end

    def self.all
        @@all
    end

end


