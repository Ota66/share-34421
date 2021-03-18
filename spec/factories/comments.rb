FactoryBot.define do
  factory :comment do
    text {'いいですね'}
    association :user
    association :tweet
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('app/assets/images/icon-250.png'), filename: 'icon-250.png')
    end
  end
end
