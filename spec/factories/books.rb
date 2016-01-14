require 'faker'

FactoryGirl.define do

  factory :book  do |f|
    f.cover_image { Faker::Avatar.image }
    f.create_at   { Faker::Time.between(DateTime.now - 365, DateTime.now) }
    f.name        { Faker::Book.title }
    f.description { Faker::Lorem.paragraphs(1) }
  end

end
