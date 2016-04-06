module DeviseToken 
	class RegistrationsController < DeviseTokenAuth::RegistrationsController

		def	create
			puts '*'*100
			puts params
			puts "*"*100
			super do |res|
				res
				# if params[:username] == 'rr'
				# 	res.save_with_payment
				# else
				# 	res.save
				# end
			end
		end
	end
end