class TestModel < ActiveRecord::Base
  attr_accessible :date_field, :float_number, :item_from_a_list, :number,
                  :required_field, :title

  validates :required_field, :presence => true
  validates :item_from_a_list, :inclusion => { :in => ['value 1', 'value 2'], :message => "%{value} is not a valid value" }
  validates :title, :length => { :minimum => 10 }
  validates :number, :numericality => { :only_integer => true }
  validates :float_number, :numericality => { :greater_than => 2 }
end
