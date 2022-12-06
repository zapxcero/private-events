# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendee, through: :attendance, source: :attendee
  has_many :attendances, foreign_key: :attended_event_id
  belongs_to :creator, class_name: 'User'

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }
end
