# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Garden, type: :model do
  describe 'factory' do
    context 'with constant attributes' do
      test_garden = FactoryBot.build(:garden, constant: true)
      subject(:garden) { test_garden }

      it { is_expected.to be_valid }
      it { is_expected.to be_a(Garden) }
      it { expect(test_garden.name).to eq('Kikotager') }
      it { expect(test_garden.latitude).to eq(0.0) }
      it { expect(test_garden.longitude).to eq(0.0) }
      it { expect(test_garden.user).to be_valid }
      it { expect(test_garden.user).to be_a(User) }
    end

    context "with Faker's attributes" do
      test_garden = FactoryBot.build(:garden)
      subject(:garden) { test_garden }

      it { is_expected.to be_valid }
      it { is_expected.to be_a(Garden) }
      it { expect(test_garden.name).to be_a(String) }
      it { expect(test_garden.latitude).to be_a(Float) }
      it { expect(test_garden.longitude).to be_a(Float) }
      it { expect(test_garden.user).to be_valid }
      it { expect(test_garden.user).to be_a(User) }
    end
  end

  describe '.create' do
    context 'with invalid name' do
      test_garden = FactoryBot.build(:garden, name: Faker::Alphanumeric.alphanumeric(3))
      it { expect(test_garden).to_not be_valid }
      test_garden = FactoryBot.build(:garden, name: Faker::Alphanumeric.alphanumeric(101))
      it { expect(test_garden).to_not be_valid }
      test_garden = FactoryBot.build(:garden, name: '')
      it { expect(test_garden).to_not be_valid }
      test_garden = FactoryBot.build(:garden, name: 7)
      it { expect(test_garden).to_not be_valid }
      test_garden = FactoryBot.build(:garden, name: 618)
      it { expect(test_garden).to_not be_valid }
    end

    context 'when name missing' do
      test_garden = FactoryBot.build(:garden, name: nil)
      it { expect(test_garden).to_not be_valid }
    end

    context 'with nil coords' do
      test_garden = FactoryBot.build(:garden, latitude: nil, longitude: nil)
      it { expect(test_garden).to_not be_valid }
    end
  end

  describe 'associations' do
    test_garden = FactoryBot.create(:garden)
    it { expect(test_garden).to belong_to(:user) }
    it { expect(test_garden).to have_many(:products) }
    it { expect(test_garden).to have_many(:comments) }
    it { expect(test_garden).to have_many(:favorites) }
    # it { expect(test_garden).to have_many_attached(:images) }
  end
end
