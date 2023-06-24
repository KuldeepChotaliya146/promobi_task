require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    let!(:course) { build_stubbed(:course, name: '') }

    it { should validate_presence_of(:name) }

    it 'should not valid' do
      expect(course).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:tutors) }
    it { should accept_nested_attributes_for(:tutors) }
  end
end