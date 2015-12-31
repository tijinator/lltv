class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_create :set_username

  def set_username
    self.username = self.email.split('@').first
  end

  def email=(val)
    write_attribute(:email, val.downcase)
  end

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
end
