require 'rails_helper'
require 'spec_helper'

RSpec.describe Shift, type: :model do
  subject do
    described_class.new(
      employee_name: Faker::Name.name,
      start: DateTime.now,
      finish: DateTime.now + 3.hours,
      break_length: Faker::Number
      )
  end
  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an employee_name" do
      subject.employee_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a start" do
      subject.start = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a finish" do
      subject.finish = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a break_length" do
      subject.break_length = nil
      expect(subject).to_not be_valid
    end
  end
end