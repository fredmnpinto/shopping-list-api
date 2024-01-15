class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_item, only: [:show, :destroy, :update]

  def index
    all_items = current_user.group.items

    render json: { items: all_items }
  end

  def show
    render json: { item: @item }
  end

  def create
    created_item = Item.create(name: item_params[:name], author: User.find_by_id(item_params[:author_id]) || current_user)

    render json: { item: created_item }, status: :created
  end

  def destroy
    @item.destroy!

    render json: {message: 'Item was successfully deleted'}
  end

  def update
    @item.update_attributes(items_params.permit(:name, :checked, :quantity))

    render json: {message: 'Item was updated successfully', item: @item}
  end

  protected
  def item_params
    params.require(:item).permit(:name, :checked, :quantity, :author)
  end

  def fetch_item
    @item = Item.find(params[:id])
  end
end
