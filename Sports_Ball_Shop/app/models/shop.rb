class Shop < ActiveRecord::Base
	attr_accessible :Brand, :Price, :Quantity, :Sold, :Type
	validates_presence_of :Brand, :Price, :Quantity, :Type
	validates_format_of :Type, :with=>/\A[[:alpha:] ]+\z/i
	validates_numericality_of :Price, :only_decimal =>true, :greater_than_or_equal_to =>0, :message => "Invalid Price"
	validates_numericality_of :Quantity, :only_integer =>true, :greater_than_or_equal_to =>1
	validates_uniqueness_of :Type, :scope => [:Brand]
end
