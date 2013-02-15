#Scrape

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def flows

  url = "http://www.dwr.state.co.us/SurfaceWater/data/division.aspx?div=2"
  doc = Nokogiri::HTML(open(url))
  flows_below_pueblo = doc.at_css("tr:nth-child(29) td:nth-child(5)").text
  flows_canon_city = doc.at_css("tr:nth-child(11) td:nth-child(5)").text
  
  puts flows_below_pueblo
  puts flows_canon_city
  
end

flows