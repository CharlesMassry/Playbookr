class Play < ActiveRecord::Base
  belongs_to :team
  has_many :media
  has_many :comments, as: :commentable
end
