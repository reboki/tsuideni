class Public::MessagesController < ApplicationController
  def create
    pp '-------'
    pp Entry.where(customer_id: current_customer.id, room_id: params[:message][:room_id])
    if Entry.where(customer_id: current_customer.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to room_path(params[:message][:room_id])
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id).merge(customer_id: current_customer.id)
  end
end
