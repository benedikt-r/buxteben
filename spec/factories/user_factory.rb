FactoryBot.define do 
 sequence(:email) { |n| "userb#{n}@example.com" }

factory :user do
        email 
        password "123456"
    end

    
factory :admin, class: User do
      email 
      password "123456"
      admin true
    end
end