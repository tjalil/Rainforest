class User < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name, :email
  validates :password, length: {minimum: 6}
  has_secure_password
  before_save :capitalize_name
  has_many :reviews
  has_many :products

  private

  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
end
