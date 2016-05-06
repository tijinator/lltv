class Order < ActiveRecord::Base
	enum status: { paid: 10, unpaid: 0}

	belongs_to :user
	has_many :course_permissions
end
