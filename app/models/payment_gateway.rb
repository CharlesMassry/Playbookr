class PaymentGateway
  AMOUNT = 800

  def self.create_customer(email, token)
    Stripe::Customer.create(
      card: token,
      email: email,
      plan: "coach_plan"
    )
  end
end
