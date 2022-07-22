class CartController < ApplicationController


  def show
    @order = current_order
  end

  def update
    product = params[:product_id]
    quantity = params[:quantity]

    if product.to_i && quantity.to_i > 0
      OrderItem.create(product_id: product.id, quantity: quantity, price: product.price)
      compute_total
    end

   
  end
  


  def compute_total (price)
    sum = 0
    @price = []
    @price.push price
    @price.each do |item|
      @total =sum += item.price
    end
    @total
  end


end
