require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

    def self.scrape_crypto
        html = open("https://cryptowat.ch/")
        doc = Nokogiri::HTML(html)
        content = doc.css("div._2oDhTH2T1-ozJ4Crux0N-r a")
        
        content.each do |element|
            name = element.css("h2").text.split("(") #splits full_name (ticker)id
            full_name = name[0] #assigns full_name to first index of arra after split; Bitcoin
            ticker = name[1].split(")#")[0]  #outputs ticker only; BTC 
            id = name[1].split(")#")[1] #list tickers 1-24
            
            current_price = element.css("span._3XNm6CSrchU-MNbu1Zh3m2").text #current price
            #change_positive = element.css("span.color-long").text # %change positive
            #change_negative = element.css("span.color-short").text # %change negative
            percent_change = element.css("span._2SYFxGdmPGEAqHRZI8P__k").text
            
            Crypto.new(id, ticker, full_name, current_price, percent_change) #creates new instance of class Crypto #belongs to relationship
            #puts name, current_price, change_positive, change_negative, ""
        end
    end

end

=begin above code will output
id 
ticker
full_name
current_price
change_positive
change_negative
=end