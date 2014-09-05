module PaymentsHelper
  def cents_to_currency(number_in_cents)
    number_to_currency(number_in_cents / 100.0)
  end
end
