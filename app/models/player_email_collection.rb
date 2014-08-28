class PlayerEmailCollection
  def initialize(email_addresses)
    @email_addresses = email_addresses
  end

  def all
    email_addresses.split
  end

  private

  attr_reader :email_addresses
end
