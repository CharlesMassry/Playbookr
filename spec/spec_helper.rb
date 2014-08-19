Monban.test_mode!
include ActionDispatch::TestProcess

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include Monban::Test::Helpers, type: :feature

  config.after :each do
    Monban.test_reset!
  end
end
