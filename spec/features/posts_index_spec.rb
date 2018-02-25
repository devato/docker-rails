require 'rails_helper'

RSpec.feature 'Posts Index', :type => :feature do
  scenario 'Should load' do
    visit posts_path
    expect(page).to have_text('Posts')
  end
  scenario 'Should load new posts page' do
    visit posts_path
        save_and_open_page

    expect(page).to have_text('Posts')
  end
end
