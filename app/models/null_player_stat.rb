class NullPlayerStat
  include Enumerable

  def [](_name)
  end

  def each
    false
  end
end
