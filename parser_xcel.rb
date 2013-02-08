require 'roo'
require 'rubygems'

require File.dirname(__FILE__) + '/lib/person.rb'
require File.dirname(__FILE__) + '/xcel.rb'

if ARGV.blank? 
	puts "Usage: ruby parcer.rb file"
	exit
end

class ParserXcel

	def initialize(xls, model)
			
		titles = xls.titles
		content = xls.content(titles)

		parsed = Array.new
		errors_list = Array.new	

		content.each_with_index do | p, i | 

			person = model.new(p)

			if person.valid?
			
				parsed << person
				
			else
				
				error = {} 
				error['line'] = i	
				error['errors']  = person.errors.full_messages
				errors_list << error
			end

		end
		
		#unless errors_list.blank?
		#	puts errors_list	
		#end

		puts parsed
	end
end
xls = Xcel.new(ARGV.first)
parsed_xml = ParserXcel.new(xls, Person)
