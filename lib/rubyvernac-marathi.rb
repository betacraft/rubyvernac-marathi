require 'rubyvernac/marathi'
require 'yaml'
require 'pry'

# create aliases - 
Dir.glob('/home/appsurfer/projects/rubyvernac-marathi/lib/translations/*').each do |filepath|
  content = YAML::load_file(File.expand_path"#{filepath}")
  #puts "working on file #{filepath}"
    
  class_name = content.keys.first.capitalize

  # class name - 
  # class_trans = content[content.keys.first]['cname']
  # Object.class_eval(" #{class_trans} = #{class_name} ") unless class_trans.length.zero?
    
  # class methods - 
  content.first.last['cpumethods'].each do |k, v|
    #puts "synching -- #{k} to #{v}"
    Object.class_eval(class_name).singleton_class.
      send(:alias_method, v.to_sym, k.to_sym) unless v.chop.length.zero?
  end

  content.first.last['cprmethods'].each do |k, v|
    #puts "synching -- #{k} to #{v}"

    Object.class_eval(class_name).singleton_class.
        send(:alias_method, v.to_sym, k.to_sym) unless v.chop.length.zero?

  end

  # instance methods - 
  content.first.last['ipumethods'].each do |k, v|
    #puts "synching -- #{k} to #{v}"
      
    Object.class_eval(class_name).send(:alias_method, v.to_sym,k.to_sym) unless 
                                                    v.chop.length.zero?
  end if content.first.last['ipumethods']

  # instance methods - 
  content.first.last['iprmethods'].each do |k, v|
    #puts "synching -- #{k} to #{v}"
      
    Object.class_eval(class_name).send(:alias_method, v.to_sym,k.to_sym) unless 
                                                    v.chop.length.zero?
  end if content.first.last['iprmethods']
    
end
