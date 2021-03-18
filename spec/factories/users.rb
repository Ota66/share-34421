FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    # introduction {'はじめまして'}

    # after(:build) do |user|
    #   user.avatar.attach(io: File.open('app/assets/images/icon-250.png'), filename: 'icon-250.png')
    # end

    # after(:build) do |user|
    #   user.header_image.attach(io: File.open('app/assets/images/icon-250.png'), filename: 'icon-250.png')
    # end
  end
end
