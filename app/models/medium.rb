class Medium < ActiveRecord::Base
  belongs_to :play
  has_one :team, through: :play
  has_attached_file :file

  validates :play, presence: true
  validates_attachment_content_type :file,
    content_type: /\A(image)|(video)\/.*\Z/
  validates_attachment_presence :file
end
