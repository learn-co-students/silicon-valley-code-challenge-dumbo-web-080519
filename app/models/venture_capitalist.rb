class VentureCapitalist
    attr_reader :name, :total_worth
    
    @@all = []
    @@tres_commas_club = []
    
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
        if total_worth >= 1000000
            @@tres_commas_club << self
        end
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@tres_commas_club
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def biggest_investment
        FundingRound.all.map do |fr|
            if fr.venture_capitalist == self
                fr.investment
            end
        end.compact.max
    end

    def invested(domain_string)
        FundingRound.all.map do |fr|
            if fr.venture_capitalist == self && fr.startup.domain == domain_string
                fr.investment
            end
        end.compact.max
    end
end
