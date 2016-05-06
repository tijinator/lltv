module DeviseToken 
	class RegistrationsController < DeviseTokenAuth::RegistrationsController

		def	create
			email	     = params[:email]
			token        = params[:stripe_card_token] if params[:stripe_card_token]
			full_name    = "#{params[:first_name]} #{params[:last_name]}"
			

			if options = params[:options] 
				order_object = options[1][:orderInfo]
				params.delete(:options)
				params.delete(:stripe_card_token)
				
				if amount = options[0][:planObject][:amount]
					super do |res|
						customer_id = one_time_payment(token, email, full_name, amount)
						res.save_customer_id(customer_id)
					end
				elsif plan = options[0][:planObject][:plan]
					super do |res|
						customer_id = monthly_payment(token, email, full_name, plan)
						res.save_customer_id(customer_id)
					end
				end
			else
				super
			end

		end

		def one_time_payment(stripe_card_token, email, full_name, amount)

			customer = Stripe::Customer.create(
				description: full_name, 
				email: email, 
				source: stripe_card_token
			)

			# begin 
				charge = Stripe::Charge.create(
					:amount => amount,
					:currency => "usd",
					:description => customer.email,
					:customer => customer.id
				)
			# rescue => e
			# 	body = e.json_body
			# 	err  = body[:error]

			# 	puts "Status is: #{e.http_status}"
			# 	puts "Type is: #{err[:type]}"
			# 	puts "Code is: #{err[:code]}"
			# 	# param is '' in this case
			# 	puts "Param is: #{err[:param]}"
			# 	puts "Message is: #{err[:message]}"
			# end

		    return customer.id
  		end

  		def monthly_payment(stripe_card_token, email, full_name, plan)
			customer = Stripe::Customer.create(
				description: full_name, 
				email: email, 
				source: stripe_card_token,
				plan: plan
			)
			return customer.id
  		end

		
	end #end of class
end #end of modue
