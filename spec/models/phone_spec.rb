require 'rails_helper'

describe Phone do

it "does not allow duplicate phone numbers" do
  contact = Contact.create(
  	firstname: 'John',
  	lastname: 'Doe',
  	email: 'test@example.com')

  contact.phones.create(
    phone_type: 'home',
    phone: '0700 111 222' )

  mobile_no = contact.phones.build(
    phone_type: 'mobile',
    phone: '0700 111 222')  

  mobile_no.valid?
  expect(mobile_no.errors[:phone]).to include('has already been taken')  		
end

it "allows two contacts to share a phone number" do 
	contact = Contact.create( 
		firstname: 'John',
		lastname: 'Doe',
		email: 'test@example.com')
    contact.phones.create(
    	phone_type: 'home',
    	phone: '0700 111 222')

    contact_1 = Contact.new(
    	firstname: 'Doe',
    	lastname: 'John',
    	email: 'test@example.com')

    no = contact_1.phones.build(
    	phone_type: 'home',
    	phone: '0700 111 222')

    
    expect(no).to be_valid
end    

end