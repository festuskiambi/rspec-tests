require 'rails_helper'

describe ContactsController do

	describe 'GET #index' do 
		context 'with params [:letter]' do 
			it "populates an array of contacts starting with letter" do
				smith = create(:contact,
					lastname: 'smith')
				jones = create(:contact,
					lastname: 'jones')

				get :index, letter: 's'

				expect(assigns(:contacts)).to match_array([smith])
			end	
			it "renders the :index template" do
				get :index, letter: 's'
				expect(response).to render_template :index
			end	
		end

		context 'without params [:letter]' do
			it "populates an array of all the contacts" do
				smtith = create(:contact,
					lastname: 'John')
				jones = create(:contact,
					lastname: 'smith')
				get :index
				expect(assigns(:contacts)).to match_array([smtith,jones])
		    end

			it "renders the :index template" do
				get :index , letter: ''
				expect(response).to render_template :index
			end	
		end	
	end

	describe 'GET #show' do
		it "assigns the requested contact to @contact" do
			contact = create(:contact)
            get :show , id: contact
            expect(assigns(:contact)).to eq contact
		end	
		it "renders the :show template" do 
			contact = create(:contact)
			get :show, id: contact
			expect(response).to render_template :show
		end	
	end 

	describe 'GET #new' do
		it "assigns the new contact to @contact" do
        	get :new 
        	expect(assigns(:contact)).to be_a_new( Contact ) 
		end	

		it "renders the :new template" do
			get :new
			expect(response).to render_template :new
	    end

	end

	describe 'GET #edit' do 
		it "assigns the requested contact to @contact" do
			contact = create(:contact)
			get :edit, id: contact
			expect(assigns(:contact)).to eq contact
		end	
		it "renders the :edit template" do 
			contact = create(:contact)
			get :edit, id: contact
			expect(response).to render_template :edit
		end	

	end	

	describe 'POST #create' do
		before :each do
			@phones = [attributes_for(:phone),
				attributes_for(:phone),
				attributes_for(:phone)]
		end	
		context 'with valid attributes'do
			it "it saves the new contact to the database"do 
				expect{
					post :create, contact: attributes_for(:contact,
						phones_attributes: @phones)
				}.to change(Contact, :count).by(1)

			end
			it "redirects to contacts#show" do 
				post :create, contact: attributes_for(:contact,
					phones_attributes: @phones)

				expect(response).to redirect_to contact_path(assigns[:contact])
					
			end		
	    end

	    context 'with invalid attributes' do
	    	it "does not save new record to the databse"do
	    		expect{
	    			post :create, contact: attributes_for(:invalid_contact)
	    		}.not_to change(Contact, :count)
	        end
	    	it "re_renders the :new template " do
	    		post :create, contact: attributes_for(:invalid_contact)
	    		expect(response).to render_template :new
	    	end	
	    end	
	end	

	describe 'PATCH #update 'do
		context 'with valid attributes'do
			it "updates the contact in the databse "
			it "renders the contacts#show"
	    end

	    context 'with Invalid attributes' do
	    	it "does not update contact in the database"
	    	it "re_renders the :edit template"
	    end	
    end

    describe 'DELETE #destroy' do
    	it "deletes the contact from the database"
    	it "redirects to contacts#index"
    end		
end