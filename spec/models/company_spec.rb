require 'spec_helper'
require 'rails_helper'

describe 'Company' do 

	it 'should not have an admin' do
		 company = FactoryBot.build_stubbed(:company)
		 expect(company.doesnt_have_admin?).to eq(true) 
	end
    
    it 'should have an admin' do 
    	user = FactoryBot.create(:user)
    	company = FactoryBot.create(:company)
    	hr_rep = FactoryBot.create(:hr_rep, company_id: company.id, user_id: user.id)
    	expect(company.doesnt_have_admin?).to eq(false)
    end

    it 'should create hr rep' do 
    	user = FactoryBot.create(:user)
    	company = FactoryBot.create(:company)
    	company.create_hr_rep(user)
    	expect(user.role).to eq("hr_rep")
    end	


    it 'display full address' do 
    	company = FactoryBot.create(:company)
    	printed_out_address = "#{company.street}, #{company.city}, #{company.zip}, #{company.state}"
    	expect(company.address).to eq(printed_out_address)
    end	

end