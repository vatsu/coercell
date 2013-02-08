require 'roo'
require 'rubygems'

require File.dirname(__FILE__) + '/lib/person.rb'
require File.dirname(__FILE__) + '/xls.rb'

if ARGV.blank? 
	puts "Usage: ruby parcer.rb file"
	exit
end

class ParserXcel

	def initialize(xls, model)
			
		titles = xls.titles
		content = xls.content(titles)

		errors_list = Array.new	

		content.each_with_index do | p, i | 

			person = model.new(p)

			unless person.valid?
				error = {} 
				error['line'] = i	
				error['errors']  = person.errors.full_messages
				errors_list << error
			end

		end
		
		unless errors_list.blank?
			puts errors_list	
		end

	end
end
xls = Xcel.new(ARGV.first)
parsed_xml = ParserXcel.new(xls, Person)
