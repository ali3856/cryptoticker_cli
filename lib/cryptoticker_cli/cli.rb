class Cryptoticker::CLI   #name needs to be changed 
    
    def call
        puts "Welcome to CryptoTicker!"
        
        Scraper.scrape_crypto
        Crypto.all.each.with_index(1) do |app, id|
        puts "#{id}. #{app.ticker}"
        end
        #binding.pry
        menu
        
    end

    def menu
        puts ""
        puts "Enter the name or number of the cryptocurrency you would like to view:"
        input = gets.strip

        if input.to_i > 0 && input.to_i <= 24
            crypto = Crypto.all[input.to_i - 1]
            puts ""
            puts "Ticker: #{crypto.ticker}"
            puts "Full name: #{crypto.full_name}"
            puts "Price: $#{crypto.current_price}"
            puts "% Change: #{crypto.percent_change}"
          menu
        elsif input == "exit" || "quit"
            puts ""
            puts "Thank you for using CryptoTicker CLI. Goodbye!"
        else
            puts ""
            puts "Invalid choice, please enter a number between 1-24:"
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