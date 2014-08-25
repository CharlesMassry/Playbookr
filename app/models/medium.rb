class Medium < ActiveRecord::Base
  belongs_to :play
  has_one :team, through: :play
  belongs_to :content, polymorphic: true
  has_many :comments, as: :commentable

  validates :content, presence: true
  validates :play, presence: true

  def self.new_content(media, play)
    new(caption: media[:caption], play: play) do |medium|
      medium.content = new_file(media[:file])
    end
  end

  def self.new_file(file)
    file ||= NullFile.new
    if file.content_type =~ /\Aimage\/.*\Z/
      Image.new(file: file)
    elsif file.content_type =~ /\Avideo\/.*\Z/
      Video.new(file: file)
    end
  end
  private_class_method :new_file
end
