require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:article_id) }
  end

  context 'associations' do
    it { should belong_to(:article) }
  end
end
