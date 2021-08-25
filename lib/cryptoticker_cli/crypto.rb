class Crypto
    attr_accessor :id, :ticker, :full_name, :current_price, :percent_change

    @@all = []

    def initialize(id, ticker, full_name, current_price, percent_change)
        @id = id
        @ticker = ticker
        @full_name = full_name
        @current_price = current_price
        @percent_change = percent_change
        @@all << self
    end

    def self.all
        @@all
    end
end