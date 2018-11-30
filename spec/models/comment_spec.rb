require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    subject(:comment) { Comment.new }
    before { comment.valid? }

    # it 'should validate presence of post' do
    #   expect(comment.errors[:post].size).to be >= 1
    #   expect(comment.errors.messages[:post]).to include "must exist"
    # end

    it 'should validate presence of body' do
      expect(comment.errors[:body].size).to be >= 1
      expect(comment.errors.messages[:body]).to include "can't be blank"
    end
  end
end
