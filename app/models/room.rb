class Room < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def create_notification_dm(current_customer, message_id)
    @multiple_entry_records = Entry.where(room_id: id).where.not(customer_id: current_customer.id)
    @single_entry_record = @multiple_entry_records.find_by(room_id: id)
    notification = current_customer.active_notifications.build(
      room_id: id,
      message_id: message_id,
      visited_id: @single_entry_record.customer_id,
      action: 'dm'
    )

    notification.save if notification.valid?
  end

end
