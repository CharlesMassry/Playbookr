class TeamStatColumn < ActiveRecord::Base
  include Enumerable
  belongs_to :team
  serialize :column_names, Array

  def each(&block)
    column_names.each(&block)
  end
end
