module DeviseToken 
	class DeviseTokenApplicationController < DeviseTokenAuth::RegistrationsController
		include DeviseTokenAuth::Concerns::SetUserByToken
	end
end
