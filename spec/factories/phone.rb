FactoryGirl.define do 
	factory :phone do
		association :contact
		phone { '0700 111 222' }

	   factory :home_phone do 	
		   phone_type :home	
	   end	
   
	   factory :work_phone do
	   phone_type :work
	   end	

	   factory  :mobile_phone do
	   phone_type :mobile_phone
	   end
	end	
end	
