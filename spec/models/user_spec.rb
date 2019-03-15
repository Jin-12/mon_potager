# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User factory' do
    context 'with constant attributes' do
      test_user = FactoryBot.build(:user, constant: true)
      subject(:user) { test_user }

      it { is_expected.to be_valid }
      it { is_expected.to be_a(User) }
      it { expect(test_user.first_name).to eq('Urbain') }
      it { expect(test_user.last_name).to eq('Test') }
      it { expect(test_user.birthdate).to eq(Date.new(1997, 3, 13)) }
      it { expect(test_user.email).to eq('urbain@example.org') }
      it { expect(test_user.description).to eq('For 3 years known as "Holy Cucumber", so big, so good') }
      it { expect(test_user.password).to eq('password') }
      it { expect(test_user.password_confirmation).to eq('password') }
    end

    context "with Faker's attributes" do
      test_user = FactoryBot.create(:user)
      subject(:user) { test_user }

      it { is_expected.to be_valid }
      it { is_expected.to be_a(User) }
      it { expect(test_user.first_name).to be_a(String) }
      it { expect(test_user.last_name).to be_a(String) }
      it { expect(test_user.birthdate).to be_a(Date) }
      it { expect(test_user.email).to match /\A#{test_user.first_name}@\w+\.\w+/i }
      it { expect(test_user.description).to be_a(String) }
      it { expect(test_user.password).to eq(test_user.password_confirmation) }
    end
  end

  describe '.create' do
    context 'with taken email' do
      test_email = Faker::Internet.safe_email
      user = FactoryBot.create(:user, email: test_email)
      test_user = FactoryBot.build(:user, email: test_email)

      it { expect(user).to be_valid }
      it { expect(test_user).to_not be_valid }
    end

    context 'with invalid email' do
      test_user = FactoryBot.build(:user, email: 'lucie@example.')
      it { expect(test_user).to_not be_valid }
      test_user = FactoryBot.build(:user, email: '@example.com')
      it { expect(test_user).to_not be_valid }
      test_user = FactoryBot.build(:user, email: 'lucieexample.com')
      it { expect(test_user).to_not be_valid }
      test_user = FactoryBot.build(:user, email: 'lucie@.com')
      it { expect(test_user).to_not be_valid }
      test_user = FactoryBot.build(:user, email: '')
      it { expect(test_user).to_not be_valid }
    end

    context 'without email' do
      test_user = FactoryBot.build(:user, email: 'nil')
      it { expect(test_user).to_not be_valid }
    end

    context 'without password' do
      test_user = FactoryBot.build(:user, password: 'nil')
      it { expect(test_user).to_not be_valid }
    end

    context 'without password_confirmation' do
      test_user = FactoryBot.build(:user, password_confirmation: 'nil')
      it { expect(test_user).to_not be_valid }
    end

    context 'with different password and password_confirmation' do
      test_password = Faker::Internet.password(10, 20, true)
      test_user = FactoryBot.build(:user, password: test_password, password_confirmation: test_password + 'o')
      it { expect(test_user).to_not be_valid }
    end

    context 'with invalid password' do
      test_user = FactoryBot.build(:user, password_confirmation: 'toto')
      it { expect(test_user).to_not be_valid }
    end

    context 'with empty profile' do
      test_user = FactoryBot.create(:user, empty_profile: true)
      subject(:user) { test_user }

      it { is_expected.to be_valid }
      it { is_expected.to be_a(User) }
      it { expect(test_user.first_name).to eq(nil) }
      it { expect(test_user.last_name).to eq(nil) }
      it { expect(test_user.birthdate).to eq(nil) }
      it { expect(test_user.email).to match /\A\w+@\w+\.\w+/i }
      it { expect(test_user.description).to eq(nil) }
      it { expect(test_user.password).to eq(test_user.password_confirmation) }
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:gardens) }
    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:statuses) }
  end
end
