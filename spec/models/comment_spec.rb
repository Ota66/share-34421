require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context '投稿できるとき' do
      it 'textとimageが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
      it 'imageが空でも投稿できる' do
        @comment.image = nil
        expect(@comment).to be_valid
      end
      it 'textが空でも投稿できる' do
        @comment.text = nil
        expect(@comment).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'textとimageが空では保存できない' do
        @comment.text = ''
        @comment.image = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'tweetが紐付いていないと保存できない' do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Tweet must exist")
      end
    end
  end
end
