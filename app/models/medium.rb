class Medium < ActiveRecord::Base
  belongs_to :play
  has_one :team, through: :play
  has_attached_file :file

  validates :play, presence: true
  validates_attachment :file,
    content_type: {
      content_type: /\A(image)|(video)\/.*\Z/
    },
    presence: true
end
