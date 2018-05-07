class AddDestinationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.column :country, :string
      t.column :city, :string
      t.column :region, :string
    end
  end
end
