require 'roo'
require 'rubygems'

class ParserXcel
  
  def initialize(file, model)
    
    @xcel = self.load_xcel(file)
    @errors_list = Array.new
    @parsed = Array.new
    xcel_final = Array.new
    content = self.content(self.titles)
    
    content.each_with_index do |p, i|
      
      person = model.new(p)
        
      if person.valid?
        @parsed << person
      else
        error = {}
        error['line'] = i+2
        error['errors']  = person.errors.full_messages
        @errors_list << error
      end
      
    end
    
    xcel_final
    
  end
  
  def data
    @parsed.each {|parsed| parsed}
  end
  
  def errors
    @errors_list.each {|error| error}
  end
  
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
  			
  	  end
      body << content_line
  	end
    body
  end
  
end