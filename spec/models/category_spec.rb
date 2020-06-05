require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should_not allow_value('dlkfmdlkmf').for(:name) }
  end

  describe 'associations' do
    it { should have_many(:articles).dependent(:destroy) }
  end
end
