require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Authentications', type: :feature do
  let!(:user) do
    User.create(name: 'John Doe',
                username: 'johndoe',
                email: 'johndoe@example.com',
                password: 'johndoe')
  end
  let!(:category) do
    Category.create!(name: 'travel',
                     priority: 0)
  end
  let!(:article) do
    Article.create!(title: 'Chernobyl before and after',
                    text: 'Soviet Union, a flourishing empire
                           that lost its power in the most obvious
                           way: the social equality status',
                    featured_image: File.open(File.join(Rails.root, 'app/assets/images/lifeopedia_pics/travel-1.jpg')),
                    author_id: user.id,
                    category_id: category.id,
                    status: 'published',
                    tag_list: 'travel, lifestyle',
                    views: 0)
  end

  describe 'Category Page' do
    before do
      visit root_path
    end

    scenario 'get Category show page', type: :feature do
      have_link 'Travel', href: '/categories?name=travel'
      have_link 'Logout', href: logout_path
      expect(page).to have_content('Travel')
      page.first('.cat-name').click
      expect(page.current_path).to eq '/'
    end

    scenario 'render category show page', type: :feature do
      expect(current_path).to eq '/'
      have_link 'Home', href: root_path
      have_link 'Write An Article', href: new_article_path
      have_link 'Logout', href: logout_path
    end
  end
end
# rubocop:enable Metrics/BlockLength
