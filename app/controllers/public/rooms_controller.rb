class Public::RoomsController < ApplicationController

def index
  @room = Room.new
end

 def create
    @room = Room.new
    @room.customer_id = current_customer.id
    @room.save
    @entry1 = Entry.create(room_id: @room.id, customer_id: current_customer.id)
    @entry2 = Entry.create(params.require(:entry).permit(:customer_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    # 参加者以外が部屋を見ようとしたときにルートに飛ばす
    # ---
    # ref: https://qiita.com/sayama0402/items/9c48bc6f9350f1543f2a
    # ref: https://qiita.com/k-o-u/items/31e4a2f9f5d2a3c7867f
    @entries = Entry.where(room_id: params[:id]).pluck(:customer_id)
    redirect_to root_path unless @entries.include?(current_customer.id)

    # メッセージの殻のインスタンス生成
    @message = Message.new

    # 過去に発言したメッセージを全件取得
    @messages = Message.where(room_id: params[:id])

    # room = Room.find(params[:id])
    # if Entry.where(customer_id: current_customer.id,room_id: @room.id).present?
    #   @messages = room.messages
    #   @message = Message.new
    #   @entries = room.entries
    # else
    #   redirect_back(fallback_location: root_path)
    # end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to posts_path
  end
  private

  def room_params
    params.require(:room).permit(:customer_id)
  end
end
