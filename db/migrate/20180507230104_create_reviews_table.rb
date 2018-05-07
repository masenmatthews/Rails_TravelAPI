class CreateReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :title, :string
      t.column :rating, :integer
      t.column :text_body, :string
      t.column :destination_id, :integer
    end
  end
end
