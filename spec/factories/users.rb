FactoryGirl.define do
    factory :user do
        email {Faker::internet.email}
        password 'secret'
        password_confirmation 'secret'

        factory :admin do
            admin true
        end    
    end    

end    