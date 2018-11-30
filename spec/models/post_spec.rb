require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    subject(:post) { Post.new } # sets the subject of this describe block
    before { post.valid? }      # runs a precondition for the test/s

    [:title, :body].each do |attribute|
      it "should validate presence of #{attribute}" do
        expect(post.errors[attribute].size).to be >= 1
        expect(post.errors.messages[attribute]).to include "can't be blank"
      end
    end
  end
end
