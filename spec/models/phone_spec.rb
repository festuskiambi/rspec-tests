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

end