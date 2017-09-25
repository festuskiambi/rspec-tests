require 'rails_helper'

describe Contact do
	it "is valid with a firstname,lastname and email" do
		contact = Contact.new(
		  firstname: 'John',
		  lastname: 'Doe',
		  email: 'test@example.com')
        expect(contact).to be_valid
	end	

	it "is invalid without a firstname" do
		contact = Contact.new(firstname: nil	)
		contact.valid?
		expect(contact.errors[:firstname]).to include("can't be blank")
	end	

	it "is invalid without a lastname" do
		contact = Contact.new(lastname: nil)
		contact.valid?
		expect(contact.errors[:lastname]).to include("can't be blank")
	end	

	it "is invalid without an email address" do
		contact =Contact.new(email: nil)
		contact.valid?
		expect(contact.errors[:email]).to include("can't be blank")
	end	

	it "is invalid with a duplicate email address" do
	    Contact.create(
		  firstname: "John",
		  lastname: "Doe",
		  email: "test@example.com"	)
		contact = Contact.new(
		  firstname: "Doe",
		  lastname: "John",
		  email: "test@example.com")
		contact.valid?
		expect(contact.errors[:email]).to include("has already been taken")

	end	

	it "returns a contact's full name as a string" do
		contact = Contact.create(
			firstname: 'John',
			lastname: 'Doe',
			email: 'test@example.com')

		expect(contact.name).to eq('John Doe')
	end	
    describe "filter last name by letter" do
    	context " matching letters" do
	 	   it "returns a sorted array of results that match " do 
		  	  jones = Contact.create(
		  		  firstname: 'Doe',
		  		  lastname: 'jones',
		  		  email: ' test@example.com')

		 	   johnstone = Contact.create(
		  		  firstname: 'Doe',
		  		  lastname: 'johnstone',
				  email: 'test1@example.com')
  
		 	   fena = Contact.create(
				  firstname: 'gitu',
		  		  lastname: 'fena',
		  	  	email: 'test2@example.com')

		  	  expect(Contact.by_letter('j')).to eq [johnstone,jones]
	 	   end
	    end

	    context "non matching letters" do

	   	   it "omits results that do not match" do 
		  	    jones = Contact.create(
		   		   firstname: 'Doe',
		   		   lastname: 'jones',
		   		   email: ' test@example.com')

		   	   johnstone = Contact.create(
		   	   	firstname: 'Doe',
		   	   	lastname: 'johnstone',
		   	   	email: 'test1@example.com')

		   	   fena = Contact.create(
		   	   	firstname: 'gitu',
		   	   	lastname: 'fena',
		   	   	email: 'test2@example.com')

		   	   expect(Contact.by_letter('j')).not_to include fena
   
	   
	   	   end	
	   	 end  
    end
end