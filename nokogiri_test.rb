#Scrape Finviz for ticker and price


require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://finviz.com/quote.ashx?t=aapl"
doc = Nokogiri::HTML(open(url))
  ticker = doc.at_css(".fullview-ticker").text
  price = doc.at_css(":nth-child(10) :nth-child(12) b").text[/[0-9\.]+/]
  price_to_book = doc.at_css(":nth-child(5) :nth-child(4) b").text[/[0-9\.]+/]


  puts "#{ticker} - #{price} price to book - #{price_to_book}"
