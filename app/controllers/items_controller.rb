class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_item, only: %i[show destroy update mark]

  def index
    all_items = current_user.group.items

    render json: { items: all_items }
  end

  def show
    render json: { item: @item }
  end

  def create
    created_item = Item.create!(name: item_params[:name],
                                author: User.find_by_id(item_params[:author_id]) || current_user, quantity: item_params[:quantity])

    render json: { item: created_item }, status: :created
  end

  def destroy
    @item.destroy!

    render json: { message: 'Item was successfully deleted' }
  end

  def update
    @item.update_attributes(items_params.permit(:name, :quantity))

    render json: { message: 'Item was updated successfully', item: @item }
  end

  def mark
    @item.update!(is_checked: params[:value])

    Rails.logger.info "ItemsController#mark: marking {@item.name} as {@item.is_checked? ? 'checked' : 'unchecked'}"
    render json: { message: 'Item was checked successfully', item: @item }
  end

  protected

  def item_params
    params.require(:item).permit(:name, :checked, :quantity, :author)
  end

  def fetch_item
    @item = Item.find(params[:id])
  end
end
