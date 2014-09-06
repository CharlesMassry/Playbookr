class PlayerEmailCollection
  include Enumerable

  def initialize(email_addresses)
    @email_addresses = email_addresses.gsub(/,/, "").split
  end

  def each(&block)
    email_addresses.each(&block)
  end

  private

  attr_reader :email_addresses
end
