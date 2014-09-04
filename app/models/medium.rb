class Medium < ActiveRecord::Base
  belongs_to :play
  has_one :team, through: :play
  belongs_to :content, polymorphic: true, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true
  validates :play, presence: true

  def self.new_content(media, play)
    new(caption: media[:caption], play: play) do |medium|
      medium.content = FileBuilder.new(media[:file]).build
    end
  end
end
