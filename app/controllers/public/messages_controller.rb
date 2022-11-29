class Public::MessagesController < ApplicationController
  def create
    if Entry.where(customer_id: current_customer.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)

      # 新規作成された@messageに紐づくroomを@roomに格納する
      @room = @message.room
      # 本引数を２つ持たせてcreate_notification_dmメソッドを実行
      @room.create_notification_dm(current_customer, @message.id)
      # (ここまで)

    else
      flash[:notice] = "メッセージ送信に失敗しました。"
    end
    redirect_to room_path(params[:message][:room_id])
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id).merge(customer_id: current_customer.id)
  end
end
