module Coercell
  module Value
    def self.coerce(model,attribute_name,value)
      attribute_type = (model.columns.select { |a| a.name == attribute_name }).first.type

      value = case attribute_type
              when :integer
                value.to_i if value.is_a? Numeric
              else
                value
              end

      value
    end
  end
end
