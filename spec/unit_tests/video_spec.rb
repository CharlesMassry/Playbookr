require 'rails_helper'

describe Video do
  it { should have_one(:medium) }
  it { should have_attached_file(:file) }
  it { should validate_attachment_presence(:file) }
end
