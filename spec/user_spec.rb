require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      password: "password",
      email: "john@doe.com"
    )
  end

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = "asdfg"
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = "johndoe"
      expect(subject).to_not be_valid
    end
  end
end