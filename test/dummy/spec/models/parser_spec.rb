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
      @parsed.data.first.first.should be_an_instance_of @model
    end
    
  end
  
  describe "list errors" do
    
    it "returns a Array of errors" do
      @parsed.data[1].first.should be_an_instance_of Hash
    end 
    
    it "returns errors line" do
      @parsed.data[1].first["line"].should_not be_nil
    end
    
    it "returns errors error" do
      @parsed.data[1].first["errors"].should be_an_instance_of Array
    end
    
  end
  
end
