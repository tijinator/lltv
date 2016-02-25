class ChapterSerializer < ActiveModel::Serializer
  self.root = false

  attributes :first_name, :last_name, :avatar_file_name

end