require 'spec_helper.rb'

describe ItemsController do
  before :each do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, author: @user)
    @items = FactoryBot.create_list(:item, 9, author: @user)

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
      get :show, params: { id: @item.id }
    end

    it { should respond_with :success }

    it 'should show the item' do
      expect(response_json[:item]).to eq JSON.parse(@item.to_json)
    end
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
      @item_params = {
        name: 'Object name',
        quantity: 3
      }
      post :create, params: { item: @item_params }
    end

    it { should respond_with :created }

    it 'should respond with the item created' do 
      expect(response_json[:item][:name]).to eq @item_params[:name]
      expect(response_json[:item][:quantity]).to eq @item_params[:quantity]
    end
  end
  
  describe '#mark' do
    before :each do
      @item = FactoryBot.create(:item, is_checked: false)
      patch :mark, params: { id: @item.id, value: true }

      @item.reload
    end

    it { should respond_with :success }

    it 'should update the object\'s mark' do 
      expect(@item.is_checked).to be_truthy
    end
  end
end
