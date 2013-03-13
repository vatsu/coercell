require 'spec_helper'

describe "ParsedXcel" do

before :each do
  @model = User
  @parsed = ParserXcel::Xcel.new("public/xcel.xls", @model)
end

  describe "new" do
    
    it "returns a ParserXcel object" do
      @parsed.should be_an_instance_of ParserXcel::Xcel
    end
    
  end
  
  describe "content" do
    
    it "returns a ParserXcel Array of Model Objects" do
      @parsed.data.first.should be_an_instance_of @model
    end
    
  end
  
  describe "list errors" do
    
    it "returns a Array of errors" do
      @parsed.list_errors.should be_an_instance_of Array
    end 
    
    it "returns errors line" do
      @parsed.list_errors.first["line"].should_not be_nil
    end
    
    it "returns errors error" do
      @parsed.list_errors.first["errors"].first.should_not be_nil
    end
    
  end
  
end
