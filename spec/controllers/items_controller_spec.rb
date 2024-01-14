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
end
