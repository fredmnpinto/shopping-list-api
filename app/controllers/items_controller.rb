class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_item, only: [:show, :create, :delete, :update]

  def index
    all_items = current_user.group.items

    render json: { items: all_items }
  end

  def show
    render json: { item: @item }
  end

  def create
    created_item = Item.create(name: item_params[:name], author: current_user, group: current_user.group)

    render json: { item: created_item }, status: :created
  end

  def delete
    @item.destroy

    render json: {message: 'Item was successfully deleted'}
  end

  def update
    @item.update_attributes(items_params)

    render json: {message: 'Item was updated successfully', item: @item}
  end

  protected
  def item_params
    params.require(:item).permit(:name, :checked)
  end

  def fetch_item
    @item = current_user.group.items.find(params[:id])
  end
end
