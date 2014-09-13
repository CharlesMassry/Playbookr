class PlayerStatColumn < ActiveRecord::Base
  include Enumerable
  belongs_to :team
  serialize :names, Array

  def each(&block)
    names.each(&block)
  end
end
