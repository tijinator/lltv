class Author < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :courses

  def full_name
    if self.first_name && self.last_name
      return self.first_name + " " + self.last_name
    end
    return self.first_name if self.first_name
    return self.last_name if self.last_name
    nil
  end
end