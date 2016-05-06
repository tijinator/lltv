class User < ActiveRecord::Base
  has_many :orders
  has_many :courses
  has_many :course_permissions

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         # :confirmable

  include DeviseTokenAuth::Concerns::User
  attr_accessor :stripe_card_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable

  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_create :set_username
  # before_save :set_username
  before_save { self.email = email.downcase }

  def set_username
    username ? self.username = username : self.username = self.email.split('@').first
  end

  # def email=(val)
  #   write_attribute(:email, val.downcase)
  # end

  # DEVISE Auth Check for activation
  # def active_for_authentication?
  #   super && self.your_method_for_checking_active # i.e. super && self.is_active
  # end

  # def inactive_message
  #   "Sorry, this account has been deactivated."
  # end

  def devise_mapping
    Devise.mappings[:user]
  end

  def full_name
    if self.first_name && self.last_name
      return self.first_name + " " + self.last_name
    end
      return self.first_name if self.first_name
      return self.last_name if self.last_name
    nil
  end


# STRIPE RELATED
   # def save_with_payment
   #    if valid?
   #      customer = Stripe::Customer.create(description: email, plan: plan_id, source: stripe_card_token)
   #      self.stripe_customer_token = customer.id
   #      save!
   #    end
   # end

  def save_customer_id(id)
    if valid?
      self.stripe_customer_token = id
      save!
    end
  end

end
