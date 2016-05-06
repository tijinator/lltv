
# Currently Not Using this Class, except charge_course

class Charge
	class << self

		def charge_course(customer_id, email, amount)
			charge = Stripe::Charge.create(
				:amount => amount,
				:currency => "usd",
				:description => email,
				:customer => customer_id
			)
		end

		def course_purchase(stripe_card_token, email, full_name, amount)
			customer = Stripe::Customer.new(
				email: email, 
				description: full_name, 
				source: stripe_card_token
			)
		end

		def monthly_subscription(stripe_card_token, email, full_name, plan)
			customer = Stripe::Customer.new(
				description: full_name, 
				email: email, 
				source: stripe_card_token,
				plan: plan
			)
		end
	end

end
