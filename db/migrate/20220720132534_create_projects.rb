class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :target_amount
      t.date :start_date
      t.date :end_date
      t.string :catch_copy_1
      t.string :catch_copy_2
      t.string :catch_copy_3
      t.integer :user_id
      t.integer :purchase_id
      t.integer :return_id
      t.integer :cmment_id
      t.string :image
      t.string :return_image
      t.integer :return_price
      t.string :return_name
      t.text :return_introduction
      t.integer :return_stock

      t.timestamps
    end
  end
end
