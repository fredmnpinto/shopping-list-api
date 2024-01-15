require 'spec_helper.rb'

describe ItemsController do
  before :each do
    @user = FactoryBot.create(:user)
    @items = FactoryBot.create_list(:item, 10, author: @user)

    sign_in @user
  end

  describe '#index' do
    before :each do
      get :index
    end

    it { should respond_with :success }

    it 'should include all items from group' do
      expect(response_json[:items].size).to eq 10
    end
  end

  describe '#show' do
    before :each do
      get :show, params: { id: @items.first.id }
    end

    it { should respond_with :success }
  end

  describe '#destroy' do 
    before :each do
      @item = FactoryBot.create(:item)
      delete :destroy, params: { id: @item.id }
    end

    it 'should destroy the item' do 
      expect(Item.exists?(@item.id)).to be_falsey
    end
  end

  describe '#create' do
    before :each do
      item_params = {
        name: 'Object name',
        quantity: 3
      }
      post :create, params: { item: item_params }
    end

    it { should respond_with :created }
  end
end
