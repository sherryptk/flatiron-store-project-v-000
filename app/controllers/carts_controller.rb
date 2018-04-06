class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |li|
       item = Item.find(li.item_id)
       item.inventory -= li.quantity
       item.save
    end
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
