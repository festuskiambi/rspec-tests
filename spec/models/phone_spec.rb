require 'rails_helper'

describe Phone do

    it "does not allow duplicate phone numbers" do
      contact = create(:contact)

       create(:home_phone,
      	contact: contact,
      	phone: '711-111-222' )

       mobile_phone = build(:mobile_phone,
       	contact: contact,
       	phone: '711-111-222')  

      mobile_phone.valid?
      expect(mobile_phone.errors[:phone]).to include('has already been taken')  		
    end

    it "allows two contacts to share a phone number" do 
    	contact = create(:contact)
    		
        contact.phones.create(
        	phone_type: 'home',
        	phone: '0700 111 222')

        smith  = build(:contact)

        no = smith.phones.build(
        	phone_type: 'home',
        	phone: '0700 111 222')
    
        
        expect(no).to be_valid
    end    

end