class Medium < ActiveRecord::Base
  belongs_to :play
  has_one :team, through: :play
  belongs_to :content, polymorphic: true

  validates :content, presence: true
  validates :play, presence: true

  def self.create_content(media, play)
    if media[:file]
      transaction do
        create(content: create_file(media[:file]),
               caption: media[:caption],
               play: play)
      end
    end
  end

  def self.create_file(file)
    if file.content_type =~ /\Aimage\/.*\Z/
      Image.create(file: file)
    elsif file.content_type =~ /\Avideo\/.*\Z/
      Video.create(file: file)
    end
  end
end
