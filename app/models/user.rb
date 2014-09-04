class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  belongs_to :team
  has_many :comments, dependent: :destroy

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

  def delete_account
    if coach?
      team.destroy
    end
    destroy
  end
end
