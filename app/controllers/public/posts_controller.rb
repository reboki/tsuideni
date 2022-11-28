class Public::PostsController < ApplicationController
  def index
    #@delivery.customer_id = current_customer.id
    #customer_address = Geocoder.search(current_customer.address)
    #latlog = customer_address.first.coordinates
    #@test = Post.near("新宿")
    #spot = Spot.find(current_customer)
    #if Post.geocoded?
    #@list = Post.nearbys(1)
    #end
    @deliverys = Delivery.all
    @delivery_name = @deliverys.where.not(customer_id: current_customer.id)
  end

  def show
    @post = Post.new
    @post.customer_id = current_customer.id
    @delivery = Delivery.find(params[:id])
    @customer = @delivery.customer
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

  def create
  @post = Post.new
  @post.customer_id = current_customer.id
  @post.save
  redirect_to posts_path
  end
end
