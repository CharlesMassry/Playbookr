require "rails_helper"

describe Medium do
  it { should belong_to(:play) }
  it { should have_one(:team) }
  it { should validate_presence_of(:play) }
  it { should have_attached_file(:file) }
  it { should validate_attachment_presence(:file) }
end
