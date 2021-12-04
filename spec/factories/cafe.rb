FactoryBot.define do
  factory :cafe do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/test.jpg')) }
    name { 'testcafe' }
    address { '東京都渋谷区' }
    number_seats { 10 }
    business_hours { Time.parse('2015-01-16 17:00:00 +0900') }
    end_business_hours { Time.parse('2015-01-16 20:00:00 +0900') }
    association :user
  end
end
