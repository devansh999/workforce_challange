require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should belong_to(:organisation).without_validating_presence }
  end
end

RSpec.describe Shift, type: :model do
  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end
end
