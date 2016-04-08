$(document).ready(function(){
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
	// Watch for a form submission
	var form_button = $("#form-submit-btn");
	form_button.click(function(event){
		event.preventDefault();
		// $("input[type=submit]").prop('disabled', true);
		$(this).prop('disabled', true);

		var error = false;
		var ccNum = $('#card_number').val(),
			cvcNum = $('#card_code').val(),
			expMonth = $('#card_month').val(),
			expYear = $('#card_year').val();
			
		if (!error) {
			// Get the Stripe token:
			Stripe.createToken({
				number: ccNum,
				cvc: cvcNum,
				exp_month: expMonth,
				exp_year: expYear
			}, stripeResponseHandler);
		}
		return false;
	}); //form submission

		function stripeResponseHandler(status, response){
			// console.log('status: ', status);
			// Get a reference to the form:
			var f = $('#payment_form');
			status == 200 ? success(response) : error(response)

			function success(response){
				// Get the token from the response
				var token = response.id;
				console.log("Token: ", token);

				// Add the token to the form:
				f.append("<input type='hidden' name='user[stripe_card_token]' value='" + token + "'/>");

				//submit the form
				f.submit()
			}

			function error(response){
				// error displayer
				console.log('response: ', response.error.message);
				form_button.removeProp('disabled')
			}
			

		}

});