require 'rails_helper'

RSpec.feature "Posting Comments", :type => :feature do
  background do
    @post = Post.create(title: 'Awesome Blog Post', body: 'Lorem ipsum dolor sit amet')
  end

  scenario "Visit root_path" do
    @user = User.create(email:'test@example.com', password: 'secret')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit post_path(@post)

    comment = 'This post is just filler text. Ripped off!'

    fill_in 'comment_body', with: comment
    click_button 'Add Comment'

    expect(page).to have_content comment
  end
end
