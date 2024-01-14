require 'spec_helper'

describe Item do
  before :each do
    @item = FactoryBot.create(:item)
  end

  it { should validate_presence_of :name }

  it { should validate_presence_of :author }

  it { should validate_presence_of :quantity }

  describe '#create' do
    it 'should assign the group of the author' do
      user = FactoryBot.create(:user)

      item = Item.create name: 'Test name', author: user, quantity: 3

      expect(item.group).to eq user.group 
    end
  end
end
