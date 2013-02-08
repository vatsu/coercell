require 'roo'
require 'rubygems'

class Xcel
	
	def load_xcel(file)
		
		extension = File.extname( file ).gsub( /^\./, '' ).downcase
		
		if extension == "ods"
			xcel = Roo::OpenOffice.new(file)
		elsif extension == "xls"
			xcel = Roo::Excel.new(file) 
		elsif extension == "xlsx"
			xcel = Roo::Excelx.new(file) 
		else
			xcel = false
		end
		
		if xcel	   
			xcel.default_sheet = xcel.sheets.first
		end

		xcel
		
	end

	def titles(line=1)
		
		titles = Array.new
		
		@xcel.first_column.upto(@xcel.last_column) do |column|
	
			titles << @xcel.cell(line,column)
	
		end
		titles		
	end	

	def content(titles, start=2)
	  body = Array.new	
		start.upto(@xcel.last_row) do |line|

			content_line = {}
		
			titles.each_with_index do | title, i |
	
				content_line[title] = @xcel.cell(line, i+1)	
				body << content_line
			end

		end
		body
	end
	
	def initialize(file)

		@xcel = load_xcel(file)

		unless @xcel
			puts "Invalid Extension"
			exit
		end
	end
end
