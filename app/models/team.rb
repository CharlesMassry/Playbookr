class Team < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :plays, dependent: :destroy
end
