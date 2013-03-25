require 'roo'
require 'parser_xcel/value'

module ParserXcel
  class Parser

    def initialize(model)
      @model = model
    end

    def prepare_content(start=2)
      @content ||= (start..@xcel.last_row).collect do |line|
        content_line = {}
        titles.each do |title|
          content_line[title[:value]] = ParserXcel::Value.coerce( @model,
                                                                   title[:value],
                                                                   @xcel.cell(line, title[:column])
                                                                 )
        end
        content_line
      end
    end

    def parse
      data = []
      errors = []

      prepare_content

      @content.each_with_index do |line_data, i|
        instance = @model.new(line_data)
        if instance.valid?
          data << instance
        else
          error = {}
          error[:line] = i+2
          error[:messages] = instance.errors.full_messages
          errors << error
        end
      end

      { :objects => data, :errors => errors }
    end

    def load_xcel(file)
      extension = File.extname(file)[1..-1].downcase

      @xcel = case extension
              when "ods"
                Roo::Openoffice.new(file)
              when "xls"
                Roo::Excel.new(file)
              when "xlsx"
                Roo::Excelx.new(file)
              else
                raise ArgumentError, "Provided file must be Openffice(.ods) or Excel(.xls or .xlsx). .#{extension} is not valid"
              end

    end

    def titles
      attributes = @model.attribute_names

      @titles ||= ((1..@xcel.last_column).collect do |column|
        value = @xcel.cell(1,column).strip #getting content from first line
        { :column => column, :value => value } if attributes.include? value
      end).compact

      @titles
    end
  end
end
