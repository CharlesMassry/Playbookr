class PaymentGateway
  AMOUNT = 800

  def self.create_customer(email, token)
    Stripe::Customer.create(
      card: token,
      description: email,
      email: email
    )
  end

  def self.charge(customer, token)
    Stripe::Charge.create(
      amount: PaymentGateway::AMOUNT,
      currency: "usd",
      customer: customer.id
    )
  end
end
