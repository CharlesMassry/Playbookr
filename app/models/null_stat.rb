class NullStat
  include Enumerable

  def stats
  end

  def to_s
  end

  def [](_name)
  end

  def each
    false
  end
end
