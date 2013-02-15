#Scrape Finviz for ticker and price


require 'rubygems'
require 'nokogiri'
require 'open-uri'

def stock_retrieve(stock)

url = "http://finviz.com/quote.ashx?t="+ stock
  puts url
doc = Nokogiri::HTML(open(url))
  ticker = doc.at_css(".fullview-ticker").text
  price = doc.at_css(":nth-child(11) :nth-child(12)").text
  price_to_book = doc.at_css(":nth-child(5) :nth-child(4)").text
  debt_to_equity = doc.at_css(":nth-child(10) :nth-child(4)").text
  eps_this_year = doc.at_css(":nth-child(4) .snapshot-td2:nth-child(6) span").text
  eps_next_year = doc.at_css(":nth-child(5) :nth-child(6)").text
  current_ratio = doc.at_css(":nth-child(9) :nth-child(4)").text
  insider_trans = doc.at_css(".table-dark-row:nth-child(2) :nth-child(8) b").text
  gross_margin = doc.at_css(":nth-child(8) :nth-child(8)").text
  
  puts "#{ticker} #{price}"
  puts "P/B = #{price_to_book}"
  puts "D/E = #{debt_to_equity}"
  puts "EPS this year = #{eps_this_year}"
  puts "EPS next year = #{eps_next_year}"
  puts "Current Ratio = #{current_ratio}"
  puts "Insider transaction = #{insider_trans}"
  puts "Gross Margin = #{gross_margin}"
  
end

stock_retrieve('goog')
stock_retrieve('aapl')
stock_retrieve('amzn')

