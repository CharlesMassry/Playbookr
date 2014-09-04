class Play < ActiveRecord::Base
  belongs_to :team
  has_many :media, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
