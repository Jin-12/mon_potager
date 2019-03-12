require 'rails_helper'

# @user = FactoryBot.create(:user)

describe 'User' do
	describe '.create' do
	  
	  # before(:all) do
	  #   @user = FactoryBot.create(:user)
	  # end
	  
	  context 'whith default attributes' do
	  	test_user = FactoryBot.build(:user)
	  	subject(:user) { test_user }

	  	it { is_expected.to be_a(User) }
	  	it { expect(test_user.first_name).to eq('Urbain') }
	  	it { expect(test_user.last_name).to eq('Test') }
	  	it { expect(test_user.age).to eq(22) }
	  	it { expect(test_user.email).to eq('urbain@example.org') }
	  	it { expect(test_user.description).to eq('For 3 years known as "Holy Cucumber", so big, so good') }
	  	it { expect(test_user.password).to eq('password') }
	  	it { expect(test_user.password_confirmation).to eq('password') }
	  	# user.statuses.each do |status|
	  	# it { expect(test_user.statuses.content).to include('admin') }
	  end

	  context "whith Faker's attributes" do
	  	test_user = FactoryBot.create(:user, fakered: true)
	  	subject(:user) { test_user }

	  	it { is_expected.to be_valid }
	  	it { is_expected.to be_a(User) }
	  	it { expect(test_user.first_name).to be_a(String) }
	  	it { expect(test_user.last_name).to be_a(String) }
	  	it { expect(test_user.age).to to be_a(Integer) }
	  	it { expect(test_user.email).to match /\A#{test_user.first_name}@\w+\.\w+/i }
	  	it { expect(test_user.description).to eq('For 3 years known as "Holy Cucumber", so big, so good') }
	  	it { expect(test_user.password).to eq('password') }
	  	it { expect(test_user.password_confirmation).to eq('password') }
	  end
	#   it "is valid with valid attributes" do
	#     expect(@user1).to be_valid
	#   end
	  
	#   it "has a unique username" do
	#     user2 = build(:user, email: "bob@gmail.com")
	#     expect(user2).to_not be_valid
	#   end
	  
	#   it "has a unique email" do
	#     user2 = build(:user, username: "Bob")
	#     expect(user2).to_not be_valid
	#   end
	  
	#   it "is not valid without a password" do 
	#     user2 = build(:user, password: nil)
	#     expect(user2).to_not be_valid
	#   end
	  
	#   it "is not valid without a username" do 
	#     user2 = build(:user, username: nil)
	#     expect(user2).to_not be_valid
	#   end
	  
	#   it "is not valid without an email" do
	#     user2 = build(:user, email: nil)
	#     expect(user2).to_not be_valid
	#   end

	end
end
