class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name.to_s
        @founder = founder.to_s
        @domain = domain.to_s
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name, domain)
        @name = name.to_s
        @domain = domain.to_s
    end

    def self.find_by_founder(founder)
        @@all.find {|startup| startup.founder == founder}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def sign_contract(venture_cap, type_of_investment, amount)
        FundingRound.new(self, venture_cap, type_of_investment, amount)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.reduce(0) {|accumulator, round| accumulator + (round.investment)}
    end

    def investors
        self.funding_rounds.map {|funding_round| funding_round.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq
    end


end
