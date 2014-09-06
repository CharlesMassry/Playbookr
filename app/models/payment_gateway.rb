class PaymentGateway
  AMOUNT = 800

  def self.create_and_charge_customer(email, token)
    customer = create_customer(email, token)
    charge(customer)
    customer
  end

  def self.create_customer(email, token)
    Stripe::Customer.create(
      card: token,
      email: email,
      plan: "coach_plan"
    )
  end

  def self.charge(customer)
    Stripe::Charge.create(
      amount: PaymentGateway::AMOUNT,
      currency: "usd",
      customer: customer.id
    )
  end
end
