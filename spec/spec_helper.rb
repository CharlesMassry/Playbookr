require "paperclip/matchers"
Monban.test_mode!

def fixture_file(path)
  File.open(Rails.root.join("spec", "asset_specs", path))
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include Monban::Test::Helpers, type: :feature
  config.include Paperclip::Shoulda::Matchers

  config.after :each do
    Monban.test_reset!
  end
end
