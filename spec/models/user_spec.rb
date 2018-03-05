require 'spec_helper'
require 'rails_helper'

describe 'User' do 

	it 'give user role worker' do
		 user = FactoryBot.create(:user)
         user.give_role("worker")
		 expect(user.role).to eq("worker") 
	end
    
    it 'give user role hr_rep' do
         user = FactoryBot.create(:user)
         user.give_role("hr_rep")
         expect(user.role).to eq("hr_rep") 
    end
    


end