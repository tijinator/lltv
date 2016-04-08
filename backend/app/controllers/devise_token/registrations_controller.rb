module DeviseToken 
	class RegistrationsController < DeviseTokenAuth::RegistrationsController

		def	create
			puts '*'*100
			puts params
			puts "*"*100
			super do |res|
				if params[:username] == ''
					# order = Order.create()
					res.save_with_mothly_payment
				else
					res.save
				end
			end
		end
	end
end
