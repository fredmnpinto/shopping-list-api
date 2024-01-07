class ItemsController < ApplicationController
  def index
    all_items = @user.group.items

    render json: all_items
  end

  def create
    created_item = Item.create(name: item_params[:name], author: @user, group: @user.group)

    render json: created_item, status: :created
  end

  def check
    @item.update_attributes!(is_checked: true)

    render json: {message: 'Item was successfully checked'}
  end

  def delete
    @item.destroy

    render json: {message: 'Item was successfully deleted'}
  end

  protected
  def item_params
    params.require(:item).permit(:name)
  end

  def fetch_item
    @item = @user.group.items.find_by_name(item_params[:name])
  end
end
