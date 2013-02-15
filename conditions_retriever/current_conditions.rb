#Scrape

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def current_conditions_spinney

  url = "http://www.royalgorgeanglers.com/south-platte-river-fishing-report#cmcondition"
  doc = Nokogiri::HTML(open(url))
  conditions = doc.at_css("#cmgen p").text.downcase
  patterns = doc.at_css("#cmpat p").text.split(",")

  puts rating(conditions)
  puts effective_patterns(patterns)
end

def current_conditions_ark_below_dam

  url = "http://www.royalgorgeanglers.com/arkansas-river-fishing-report"
  doc = Nokogiri::HTML(open(url))
  conditions = doc.at_css("#atwgen span").text.downcase
  patterns = doc.at_css("#atwpat p:nth-child(1) , #atwgen span").text.split(",")

  puts rating(conditions)
  puts effective_patterns(patterns)
end

def rating(conditions)
  if conditions.include?("good")
    return "good"
  elsif conditions.include?("fair")
    return "fair"
  elsif conditions.include?("poor")
    return "poor"
  else
    return "average"
  end
end

def effective_patterns(patterns)
 array = patterns.shuffle
 return array[0]
 
end

current_conditions_spinney
current_conditions_ark_below_dam
