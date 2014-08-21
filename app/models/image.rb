class Image < ActiveRecord::Base
  has_one :medium, as: :content
  has_attached_file :file

  validates_attachment_content_type :file,
      content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :file
end
