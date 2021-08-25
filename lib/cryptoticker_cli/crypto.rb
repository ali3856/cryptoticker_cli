class Crypto
    attr_accessor :id, :ticker, :full_name, :current_price, :change_positive, :change_negative

    @@all = []

    def initialize(id, ticker, full_name, current_price, change_positive, change_negative)
        @ticker = ticker
        @full_name = full_name
        @current_price = current_price
        @change_positive = change_positive
        @change_negative = change_negative
        @@all << self
    end

    def self.all
        @@all
    end
end