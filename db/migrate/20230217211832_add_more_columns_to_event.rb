class AddMoreColumnsToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :location, :string
    add_column :events, :date, :date
    add_column :events, :name, :string
  end
end
