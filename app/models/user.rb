class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  belongs_to :team
  has_many :comments, dependent: :destroy
  has_many :plays, through: :team
  has_one :player_stat, foreign_key: :player_id
  after_create :create_player_stat

  def self.create_as_player(user_params, token)
    if token
      user = Monban::Services::SignUp.new(user_params).perform
      user.update(team: token.team, role: "Player")
      token.destroy
      user
    end
  end

  def coach?
    role == "Coach"
  end

  def player?
    role == "Player"
  end

  def permission_to_change_comment?(comment)
    coach? || comment.user_id == id
  end

  def delete_account
    if coach?
      team.destroy
    end
    destroy
  end

  def self.create_customer(user_params, token)
    transaction do
      customer = PaymentGateway.create_and_charge_customer(
        user_params[:email],
        token
      )
      create_user_as_customer(user_params, customer)
    end
  end

  def self.create_user_as_customer(user_params, customer)
    user = Monban::Services::SignUp.new(user_params).perform
    user.update(stripe_customer_id: customer.id)
    user
  end

  private

  def create_player_stat
    PlayerStat.create(team: team, player: self)
  end
end
