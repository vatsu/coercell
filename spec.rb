require "parser_xcel"
require "person.rb"

describe "ParsedXcel" do

before :each do
  @model = Person
  @parsed = ParserXcel.new("xcel.xls", @model)
end

  describe "new" do
    
    it "returns a ParserXcel object" do
      @parsed.should be_an_instance_of ParserXcel
    end
    
  end
  
  describe "content" do
    
    it "returns a ParserXcel Array of Model Objects" do
        @parsed.data.first.should be_an_instance_of @model
    end
    
  end
  
  describe "list errors" do
    
    it "returns a Array of errors" do
      @parsed.errors.should be_an_instance_of Array
    end 
    
    it "returns errors line" do
      @parsed.errors.first["line"].should_not be_nil
    end
    
    it "returns errors error" do
      @parsed.errors.first["errors"].first.should_not be_nil
    end
    
  end
  
  
end
