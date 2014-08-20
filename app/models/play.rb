class Play < ActiveRecord::Base
  belongs_to :team
  has_many :media
end
