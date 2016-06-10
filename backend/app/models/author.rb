class Author < ActiveRecord::Base
  mount_uploader :avatar, AuthorUploader
  has_many :courses
  
  validates :first_name, length: {minimum: 2}
  validates :last_name, length: {minimum: 2}
  validates :bio, length: {minimum: 10}
  validates :avatar, presence: true

  # def full_name
  #   if self.first_name && self.last_name
  #     return self.first_name + " " + self.last_name
  #   end
  #   return self.first_name if self.first_name
  #   return self.last_name if self.last_name
  #   nil
  # end

end