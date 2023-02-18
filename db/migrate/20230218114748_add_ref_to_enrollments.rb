class AddRefToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrollments, :attendee, null: false, foreign_key: {to_table: :users}
    add_reference :enrollments, :attended_event, null: false, foreign_key: {to_table: :events}
  end
end
