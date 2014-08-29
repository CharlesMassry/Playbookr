class PlayerEmailCollection
  include Enumerable

  def initialize(email_addresses)
    @email_addresses = email_addresses
  end

  def each
    index = 0
    while index < to_a.length
      email_address = to_a[index]
      yield(email_address)
      index += 1
    end
  end

  def to_a
    email_addresses.split
  end

  private

  attr_reader :email_addresses
end
