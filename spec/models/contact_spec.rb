require 'rails_helper'

describe Contact do
	it 'has a valid factory ' do 
		expect(build(:contact)).to be_valid
	end	
	

	it 'has three phone numbers' do
		expect(create(:contact).phones.count).to eq (3)
	end	

	it "is invalid without a firstname" do
		contact = build(:contact,firstname: nil	)
		contact.valid?
		expect(contact.errors[:firstname]).to include("can't be blank")
	end	

	it "is invalid without a lastname" do
		contact = build(:contact,lastname: nil)
		contact.valid?
		expect(contact.errors[:lastname]).to include("can't be blank")
	end	

	it "is invalid without an email address" do
		contact = build(:contact,email: nil)
		contact.valid?
		expect(contact.errors[:email]).to include("can't be blank")
	end	

	it "is invalid with a duplicate email address" do
	    create(:contact,
		  email: "test@example.com"	)
		contact = build(:contact,
		  email: "test@example.com")
		contact.valid?
		expect(contact.errors[:email]).to include("has already been taken")

	end	

	it "returns a contact's full name as a string" do
		contact = build(:contact,
			firstname: 'John',
			lastname: 'Doe')

		expect(contact.name).to eq('John Doe')
	end	
    describe "filter last name by letter" do
       
       before :each do
       	  @jones = create(:contact,
		  	firstname: 'Doe',
		  	lastname: 'jones',
		  	)

       	  @johnstone = create(:contact,
		  	firstname: 'Doe',
		  	lastname: 'johnstone',
			)

       	  @fena = create(:contact,
			firstname: 'gitu',
		  	lastname: 'fena',
		  )
        end	

    	context " matching letters" do
	 	   it "returns a sorted array of results that match " do   
		  	  expect(Contact.by_letter('j')).to eq [@johnstone,@jones]
	 	   end
	    end

	    context "non matching letters" do

	   	   it "omits results that do not match" do 
		   	  expect(Contact.by_letter('j')).not_to include @fena
   	   	   end	
	   	 end  
    end
end