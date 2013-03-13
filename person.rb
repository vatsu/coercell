	require 'active_model'
 	
class Person
  include ActiveModel::Validations
 	include ActiveModel::Serialization
 	 
 	 
 	validates_presence_of :first_name, :last_name
 	 
 	attr_accessor :first_name, :last_name
 	  
 	def initialize(attributes = {})  
 	  attributes.each do |name, value|  
 	    send("#{name}=", value)  
 	  end  
 	end  
 	 
end