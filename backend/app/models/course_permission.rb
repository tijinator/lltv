class CoursePermission < ActiveRecord::Base
	# enum active: { active: 10, inactive: 0}
	# enum status: [ :active, :archived ]

	belongs_to :user
	belongs_to :course
	belongs_to :order


	class << self
		def one_course_permission(user_id, course_id, order_id, order_date)
			CoursePermission.create({
				user_id: user_id, 
				order_id: order_id, 
				course_id: course_id,
				order_date: order_date, 
				# start_date: DateTime.now.in_time_zone.midnight,
				# end_date: DateTime.now.in_time_zone.midnight + 1.month,
				active: true
			})
		end

		def all_montly_course_permission(user_id, order_id, order_date)
			CoursePermission.create({
				user_id: user_id, 
				order_id: order_id, 
				course_id: 0,
				order_date: order_date, 
				start_date: DateTime.now.in_time_zone.midnight,
				end_date: DateTime.now.in_time_zone.midnight + 1.month,
				active: true
			})
		end



		# def monthly_permission
		# 	self.course_id = 0
		# 	self.start_date = DateTime.now.in_time_zone.midnight
		# 	self.end_date = self.start_date + 1.month
		# end

		# def yearly_permission
		# 	self.course_id = 0
		# 	self.start_date = DateTime.now.in_time_zone.midnight
		# 	self.end_date = self.start_date + 1.year
		# end
	end
	
end
