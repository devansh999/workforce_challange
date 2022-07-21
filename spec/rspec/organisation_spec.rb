require 'rails_helper'
require 'spec_helper'

RSpec.describe Organisation, type: :model do
  subject do
    described_class.new(
      name: Faker::Name.name,
      hourly_rate: 11.5
    )
  end

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without hourly_rate" do
      subject.hourly_rate = nil
      expect(subject).to_not be_valid
    end
  end
end