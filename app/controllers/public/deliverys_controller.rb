class Public::DeliverysController < ApplicationController
  def index
    @deliverys = Delivery.all
    @delivery_name = @deliverys.where(customer_id: current_customer.id)
  end

  def show
    @post = Post.all
    @delivery = Delivery.find(params[:id])
    @customer=Customer.find(@delivery.customer_id)
    @currentUserEntry=Entry.where(customer_id: current_customer.id)
    @userEntry=Entry.where(customer_id: @customer.id)
    unless @customer.id == current_customer.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      Post.create(:address => current_customer.address)
      redirect_to deliverys_path
    else
      render :new
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliverys_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:place, :section, :quantity)
  end
end
