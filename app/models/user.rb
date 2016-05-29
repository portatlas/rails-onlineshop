class User < ActiveRecord::Base
  has_many :orders
  has_many :product_orders, through: :orders
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password

  def admin?
    self.admin == User.find(username: 'tim')
  end

end
