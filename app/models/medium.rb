class Medium < ActiveRecord::Base
  belongs_to :play
  has_one :team, through: :play
  belongs_to :content, polymorphic: true

  validates :content, presence: true
  validates :play, presence: true

  def self.create_content(media, play)
    medium = new(caption: media[:caption], play: play)
    medium.content = create_file(media[:file])
    medium.save
  end

  def self.create_file(file)
    file ||= NullFile.new
    if file.content_type =~ /\Aimage\/.*\Z/
      Image.new(file: file)
    elsif file.content_type =~ /\Avideo\/.*\Z/
      Video.new(file: file)
    end
  end
end
