class Event < ApplicationRecord
    
    belongs_to :creator, class_name: "User"
    has_many :enrollments, foreign_key: :attended_event_id
    has_many :attendees, through: :enrollments, source: :attendee

    
end
