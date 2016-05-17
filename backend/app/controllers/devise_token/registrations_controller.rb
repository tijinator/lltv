module DeviseToken 
	class RegistrationsController < DeviseTokenApplicationController

		def	create
			if options = params[:options] 
				email	     = params[:email]
				token        = params[:stripe_card_token] if params[:stripe_card_token]
				full_name    = "#{params[:first_name]} #{params[:last_name]}"
				order_object = options[1][:orderInfo]
				params.delete(:options)
				params.delete(:stripe_card_token)

				if options[0][:planObject][:amount]
					amount       = options[0][:planObject][:amount]
					course_id    = options[0][:planObject][:course_id]
				end

				
				# Stripe Customer Create
				customer = Stripe::Customer.new
				customer.email       = email
				customer.description = full_name
				customer.source      = token

				if plan = options[0][:planObject][:plan]
					customer.plan = plan
				end
					
				super do |res|
					customer.save

					# Order Save
					order = Order.create({user_id: res.id, order_total_amount: amount }.merge(order_object))

					if amount
						# Stripe Charge for One time Course
						Charge.charge_course(customer.id, customer.email, amount) 
						CoursePermission.one_course_permission(res.id, course_id, order.id, order.created_at)
					else
						CoursePermission.all_montly_course_permission(res.id, order.id, order.created_at)
					end
					

					res.save_customer_id(customer.id)
				end
			else
				super
			end

		end
		
	end #end of class
end #end of module
