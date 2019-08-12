class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name.to_s
        @total_worth = total_worth.to_f
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|venture_capitalist| venture_capitalist.total_worth >= 1000000000}
    end

    def offer_contract(startup, type_of_investment, amount)
        FundingRound.new(startup, self, type_of_investment, amount)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by {|funding_round| funding_round.investment}
    end

    def investments_by_domain(domain)
        self.funding_rounds.select {|funding_round| funding_round.startup.domain == domain}
    end

    def invested(domain)
        self.investments_by_domain(domain).reduce(0) {|accumulator, current_investment| accumulator + current_investment.investment}
    end


end
