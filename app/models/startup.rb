class Startup
    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end 

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end.count
    end

    def total_funds
        FundingRound.all.map do |fr|
            fr.investment if fr.startup == self
        end.compact.sum
    end

    def investors
        FundingRound.all.map do |fr|
            if fr.startup == self
                fr.venture_capitalist
            end
        end.uniq.compact # kept returning a nil value for existing                                       venture_capitalists that did not invest
    end

    def big_investors
        FundingRound.all.map do |fr|
            if fr.startup == self && VentureCapitalist.tres_commas_club.include?(fr.venture_capitalist)
                fr.venture_capitalist
            end
        end.uniq.compact
    end
end

