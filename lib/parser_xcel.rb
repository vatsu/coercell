require "parser_xcel/version"
require "roo"

module ParserXcel
  class Xcel 
  
    def initialize(file, model)
    
      @xcel = self.load_xcel(file)

      @content = self.content(self.titles)
      @model = model
    
    end
  
    def data
      data = Array.new
      errors = Array.new
      @content.each_with_index do |p, i|
        tmp_data = @model.new(p)
        if tmp_data.valid? 
          data << tmp_data
        else
          error = {}
          error['line'] = i+2
          error['errors'] = tmp_data.errors.full_messages
          errors << error
        end
        
      end  
       
      return data, errors
      
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
