class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :room, optional: true
  belongs_to :message, optional: true
  belongs_to :visitor, class_name: 'Customer', optional: true
  belongs_to :visited, class_name: 'Customer', optional: true
end

