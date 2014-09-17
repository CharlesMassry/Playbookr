require "paperclip/matchers"
require 'webmock/rspec'
require "capybara/webkit/matchers"
Monban.test_mode!
WebMock.disable_net_connect!(allow_localhost: true)
Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include Monban::Test::Helpers, type: :feature
  config.include Paperclip::Shoulda::Matchers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers

  def find_user(user)
    User.find_by(email: user.email)
  end

  config.after :each do
    Monban.test_reset!
  end

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/test_files/"])
  end
end
