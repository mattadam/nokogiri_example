#Scrape

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def stock_retrieve(stock)

  url = "http://finviz.com/quote.ashx?t="+ stock
  doc = Nokogiri::HTML(open(url))
  ticker = doc.at_css(".fullview-ticker").text
 
 
end

