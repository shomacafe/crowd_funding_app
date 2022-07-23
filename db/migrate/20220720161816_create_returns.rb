class CreateReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :returns do |t|
      t.string :return_image
      t.integer :return_price
      t.string :return_name
      t.text :return_introduction
      t.integer :return_stock
      t.integer :user_id
      t.integer :project_id
      t.integer :purchase_id

      t.timestamps
    end
  end
end
