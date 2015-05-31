class Admin < ActiveRecord::Base
	attr_accessible :password, :user_name
end
