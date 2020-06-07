require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password) }
    it { should_not allow_value('xy').for(:username) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:articles).with_foreign_key('author_id').dependent(:destroy) }
    it { should have_many(:votes) }
    it { should have_many(:voted_articles).through(:votes) }
    it { should have_many(:bookmarks) }
    it { should have_many(:bookmarked_articles).through(:bookmarks) }
  end
end
