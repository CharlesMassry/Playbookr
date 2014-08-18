Monban.test_mode!

RSpec.configure do |config|
  config.include Capybara::DSL

  config.include Monban::Test::Helpers, type: :feature

  config.after :each do
    Monban.test_reset!
  end
end
