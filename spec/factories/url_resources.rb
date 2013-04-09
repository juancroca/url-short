FactoryGirl.define do 
  factory :url_resource do
    url_string "http://www.fakeurl.com"
    association :user
    
    factory :invalid_url_resource do
      url_string nil
    end
  end
end