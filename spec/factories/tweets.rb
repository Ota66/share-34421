FactoryBot.define do
  factory :tweet do
    text   {'初投稿'}
    video { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/A-3.mov')) }
    association :user
    
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('app/assets/images/icon-250.png'), filename: 'icon-250.png')
    end
  end
end
