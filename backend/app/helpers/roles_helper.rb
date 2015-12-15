module RolesHelper
  @@roles = {
    'General' => 0,
    'Data Entry' => 10,
    'Publisher' => 20,
    'Superuser' => 30
  }

  def self.code(str)
    return @@roles[str]
  end

  def self.value(id)
    return @@roles.key(id)
  end
end