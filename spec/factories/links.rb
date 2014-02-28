# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  url          :string(255)
#  text         :text
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title {Faker::Internet.domain_word}
    url {Faker::Internet.domain_name}
    text {Faker::Lorem.sentence}
  end
end
