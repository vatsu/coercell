require "parser_xcel/version"
require "roo"

module ParserXcel
  class Xcel 
  
    def initialize(file)
    
      @xcel = self.load_xcel(file)

      @content = self.content(self.titles)
    
    end
  
    def check(model)
      data = Array.new
      errors = Array.new
      @content.each_with_index do |p, i|
        if model.new(p).valid?
          data << model
        else
          error = {}
          error['line'] = i+2
          error['errors'] = model.errors.full_messages
          errors << error
        end 
      end   
      @data = data
      @errors = errors
    end
    
    def data
      @data
    end
    
    def errors
      @errors
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
end
