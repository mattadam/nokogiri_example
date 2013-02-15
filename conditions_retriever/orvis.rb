#Scrape

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def current_conditions_orvis

  url = "http://www.orvis.com/fishing_report.aspx?locationid=5937"
  doc = Nokogiri::HTML(open(url))
  conditions_below_spinney = doc.at_css("#dvMeter img").to_s
 
  url = "http://www.orvis.com/fishing_report.aspx?locationid=5929"
  doc = Nokogiri::HTML(open(url))
  conditions_blue = doc.at_css("#dvMeter img").to_s
  
  puts orvis_conditions(conditions_below_spinney)
  puts orvis_conditions(conditions_blue)

end

def orvis_conditions(conditions)

  if conditions.include?("meter-fish-elsewhere")  
    return "poor"
  elsif conditions.include?("meter-just-ok")
    return "fair" 
  elsif conditions.include?("meter-good")
    return "good"
  elsif conditions.include?("meter-excellent") or conditions.include?("meter-red-hot")
    return "great"
  end
  
end
puts current_conditions_orvis