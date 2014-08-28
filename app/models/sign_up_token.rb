class SignUpToken < ActiveRecord::Base
  belongs_to :team

  validates :team, presence: true
  validates :token, presence: true
  validates :email, presence: true

  def self.create_token(email, team)
    secure_token = SecureRandom.urlsafe_base64
    create(token: secure_token, email: email, team: team)
  end
end
