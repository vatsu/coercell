require 'spec_helper'

describe "Coercell" do

before :each do
  @model = TestModel
end

  describe "processing xls file" do
    it "returns apropriated ROO object" do
      parser = Coercell::Parser.new(@model)
      parser.spreadsheet = "public/test_file.xls"
      parser.spreadsheet.should be_an_instance_of Roo::Excel
    end
  end

  describe "processing xlsx file" do
    it "returns apropriated ROO object" do
      parser = Coercell::Parser.new(@model)
      parser.spreadsheet = "public/test_file.xlsx"
      parser.spreadsheet.should be_an_instance_of Roo::Excelx
    end
  end

  describe "processing ods file" do
    it "returns apropriated ROO object" do
      parser = Coercell::Parser.new(@model)
      parser.spreadsheet = "public/test_file.ods"
      parser.spreadsheet.should be_an_instance_of Roo::Openoffice
    end
  end

  describe "parsing a file" do
    describe "with only valid records" do
      before :each do
        @parser = Coercell::Parser.new(@model)
        @parser.spreadsheet = 'public/valid_file.xls'
        @parsed_data = @parser.parse!
      end

      it "returns an empty array of errors" do
        @parser.errors.should be_empty
      end

      it "returns a non empty array of parsed objects" do
        @parser.valid_objects.should_not be_empty
      end

      it "returns an array of parsed objects that are valid instances of @model" do
        @parser.valid_objects.each do |obj|
          obj.valid?.should be_true
        end
      end

      it "returns an array of parsed objects with the same number of described objects" do
        num_of_described_objects = @parser.spreadsheet.last_row - 1
        @parser.valid_objects.count.should == num_of_described_objects
      end

    end

    describe "with both valid and invalid records" do
       before :each do
        @parser = Coercell::Parser.new(@model)
        @parser.spreadsheet = 'public/half_valid_file.xls'
        @parsed_data = @parser.parse!
      end

      it "returns a non empty array of errors" do
        @parser.errors.should_not be_empty
      end

      it "returns an array of errors that matchs the errors of invalid records" do
        @parser.errors.each do |err|
          array_values = @parser.send(:titles).collect do |title|
            [ title[:value], Coercell::Value
                             .coerce( @model,
                                      title[:value],
                                      @parser.spreadsheet.cell(err[:line],
                                                               title[:column]))
            ]
          end

          obj = @model.new(Hash[array_values])
          obj.valid?

          (obj.errors.full_messages == err[:messages]).should be_true # wtf?!?
        end
      end

      it "returns an non empty array of objects" do
        @parser.valid_objects.should_not be_empty
      end

      it "returns two arrays, objects and errors. The sum of their lengths should be the number of described objects" do
        parsed_data_count = @parser.valid_objects.count + @parser.errors.count
        num_of_described_objects = @parser.spreadsheet.last_row - 1
        parsed_data_count.should == num_of_described_objects
      end
    end
  end
end
