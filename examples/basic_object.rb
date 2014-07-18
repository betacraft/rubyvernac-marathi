# 
# a = Greeter.new('Ram')
#  
# a.say_hi
# Hi Ram
#
# a.say_bye
# Bye Ram
#
require 'rubyvernac-marathi'

class Cविद्यार्थी

  attr_accessor :नाव

  def पास_झाला?
    puts "हो, पास झाला #{@नाव}"
    return true
  end
end

चिंटू = Cविद्यार्थी.नवीन
चिंटू.नाव = 'चिंटू'
चिंटू.पास_झाला?
