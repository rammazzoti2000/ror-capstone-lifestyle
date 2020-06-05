require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe 'associations' do
    it { should have_many(:taggings).dependent(:destroy) }
    it { should have_many(:articles).through(:taggings) }
  end
end
