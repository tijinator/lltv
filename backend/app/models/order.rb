class Order < ActiveRecord::Base
	has_many :course_permissions
end
