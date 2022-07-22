class ApplicationController < ActionController::Base
    
  before_action :authenticate_user!, except: %i[index]

  def current_order
    if current_user
      @order = Order.where(user_id: current_user.id).where(state: "created").last
      if @order.nil?
        @order = Order.create(user: current_user, state: "created")
      end
      return @order
    end

    nil
  end


  
  def compute_total
    sum = 0
    @order.order_items.price.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end

end



