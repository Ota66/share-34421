require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイート投稿' do
    context '投稿できるとき' do
      it 'textとimageとvideoが存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'textが存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'textとvideoが存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'videoが空でも投稿できること' do
        @tweet.video = nil
        expect(@tweet).to be_valid
      end
      it 'imageが空でも投稿できること' do
        @tweet.image = nil
        expect(@tweet).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'textとimageとvideoが空では投稿できない' do
        @tweet.text = ''
        @tweet.image = nil
        @tweet.video = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'videoのみでは投稿できない' do
        @tweet.text = ''
        @tweet.image = nil
        @tweet.video = 'A-3.mov'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end
