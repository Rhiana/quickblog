require 'rails_helper'

RSpec.feature 'Managing Posts', :type => :feature do

  scenario 'Guests cannot create posts' do
    visit root_path
    click_link 'New Post'

    expect(page).to have_content 'Sign up | Login'
  end

  scenario 'Posting a new blog' do
    @user = User.create(email:'test@example.com', password: 'secret')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit root_path

    click_link 'New Post'

    expect(page).to have_content 'New post'

    fill_in 'Title', with: 'I love cheese'
    fill_in 'Body', with: "It's pretty amazing, don't you think?"

    click_button 'Save Post'
    expect(page).to have_content 'I love cheese'
  end

  context 'with an existing blog post' do
    background do
      @post = Post.create(title: 'Awesome Blog Post', body: 'Lorem ipsum dolor sit amet')
    end

    scenario 'Editing an existing blog' do
      @user = User.create(email:'test@example.com', password: 'secret')

      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      visit post_path(@post)

      page.driver.browser.authorize 'admin', 'secret'
      click_link 'Edit'

      fill_in 'Title', with: 'Not really Awesome Blog Post'
      click_button 'Save Post'

      expect(page).to have_content 'Not really Awesome Blog Post'
    end
  end
end
