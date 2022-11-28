class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!


  def index
    @customer = current_customer
  end

   def show
    @customer=Customer.find(params[:id])
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

  def edit
    @customer = current_customer
  end

  def update
  @customer = current_customer
  if @customer.update(customer_params)
    flash[:notice] = "You have updated user successfully."
      redirect_to my_page_path
  else
      render :edit
  end
  end

  def unsubscribe
     @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(delete_flag: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :kana_last_name, :kana_first_name, :zipcode, :address,
    :phone_number,:email,:password,:delete_flag)
  end

end
