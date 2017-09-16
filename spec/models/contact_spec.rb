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
	it "is invalid without an email address"
	it "is invalid with a duplicate email address"
	it "returns a contact's full name as a string"
end