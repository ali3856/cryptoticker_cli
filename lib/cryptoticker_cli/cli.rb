class Cryptoticker::CLI   #name needs to be changed 
    
    def call
        puts "Welcome to CryptoTicker!"
        
        Scraper.scrape_crypto
        crypto_list
        #binding.pry
        menu
    end

    def instructions
        puts "Instructions:"
        puts "1. Enter the number of the cryptocurrency you would like to view."
        puts "2. Or enter 'list' to view the full list of cryptocurrencies at any time."
        puts "3. Lastly enter 'exit' to end the program."
    end

    def display_crypto
        crypto = Crypto.all[@input.to_i - 1]
        puts ""
        puts "Ticker: #{crypto.ticker}"
        puts "Full name: #{crypto.full_name}"
        puts "Price: $#{crypto.current_price}"
        puts "24 HR % Change: #{crypto.percent_change}"
    end
    
    def crypto_list
        Crypto.all.each.with_index(1) do |app, id|
            puts "#{id}. #{app.ticker}"
        end
    end

    def menu
        puts ""
        instructions
        puts ""
        puts "Enter your command:"
        @input = gets.chomp

        if @input.to_i > 0 && @input.to_i <= 24
            display_crypto
            menu
        elsif @input == "list"
            crypto_list
            menu
        elsif @input == "exit"
            puts ""
            puts "Thank you for using CryptoTicker CLI. Goodbye!"
            puts ""
            exit
        else
            puts ""
            puts "Invalid command...please enter a valid command from the instructions below."
            menu
        end
    end
end

=begin 
flow of this class
welcome message
display list of cryptos
ask for number of cryptocurrency they would like to view
output crypto with full name. current price, % change,
ask for another input - 
if given another input, output info
if given exit/quit close the CLI
=end