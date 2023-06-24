require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'validations' do
    let!(:tutor) { build_stubbed(:tutor, first_name: '', last_name: '') }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it 'should not valid' do
      expect(tutor).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:course) }
  end
end
