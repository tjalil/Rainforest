class User < ActiveRecord::Base
  has_secure_password
  before_save :capitalize_name

  private

  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
end
