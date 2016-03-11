module RolesHelper
  @@roles = {
    'General' => 0,
    'Data Entry' => 10,
    'Publisher' => 20,
    'Superuser' => 30
  }

class << self
  def code(str)
    return @@roles[str]
  end

  def value(id)
    return @@roles.key(id)
  end
end

  def require_data_entry
    unless current_user && current_user.role >= RolesHelper.code('Data Entry')
      puts "**************************"
      puts current_user
      redirect_to root_url(host: request.domain)
    end
  end

  def require_publisher
    unless current_user && current_user.role >= RolesHelper.code('Publisher')
      redirect_to courses_path
    end
  end

  def require_superuser
    unless current_user && current_user.role >= RolesHelper.code('Superuser')
      redirect_to courses_path
    end
  end
end