require 'active_model'
require 'active_model/validations'

class Person
  include ActiveModel::Validations

  validates_presence_of :first_name, :last_name

  attr_accessor :first_name, :last_name, :attributes
 
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
	@attributes = attributes
  end
 
  def validate(record)
    record.errors[:first_name] = "must exist" if record.first_name.blank?
    record.errors[:last_name] = "must exist" if record.last_name.blank?
  end
  
  def attributes_name
    ["first_name", "last_name"]
  end
end
