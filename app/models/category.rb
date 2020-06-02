class Category < ApplicationRecord

  has_many :articles, dependent: :destroy

  has_many :event_attendees, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :event_attendees

  validates :name, :priority, presence: true
end
