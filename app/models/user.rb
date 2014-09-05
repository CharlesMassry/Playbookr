class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  belongs_to :team
  has_many :comments

  def self.create_as_player(user_params, token)
    if token
      user = Monban::Services::SignUp.new(user_params).perform
      user.update(team: token.team)
      token.destroy
      user
    end
  end

  def self.create_customer(user_params, token)
    transaction do
      customer = PaymentGateway.create_customer(user_params[:email], token)
      PaymentGateway.charge(customer, token)
      user = Monban::Services::SignUp.new(user_params).perform
      user.update(customer: customer.id)
      user
    end
  end
end
