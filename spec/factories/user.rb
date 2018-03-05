FactoryBot.define do 
	factory :user do
		email 'testemail@yopmail.com'
		password 'password'
		reset_password_token 'abc'
	end
end