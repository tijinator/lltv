class Admin::AdminController < ApplicationController
  include RolesHelper
  layout 'sb2'

  before_action :admin_nav_setup
  before_action :user_signed_in?
  # before_action :authenticate_user!, except: [:home]
  # before_filter :require_data_entry

  def payment_processer

      email = params[:user][:email]
      stripe_card_token = params[:user][:stripe_card_token]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      
      customer = Stripe::Customer.create(
        description: params[:user][:username], 
        email: email, 
        source: stripe_card_token
      )
      
      charge = Stripe::Charge.create(
        :amount => params[:user][:amount],
        :currency => "usd",
        # :source => stripe_card_token,
        :description => email,
        :customer => customer.id
      )

      render plain: {params: params, customer: customer, charge: charge }
    rescue Stripe::CardError => e
      render plain: {error: e}
    end

  end

protected

  def admin_nav_setup
    @courses = Course.all.order(:position)
    @level = 2
  end
  
end