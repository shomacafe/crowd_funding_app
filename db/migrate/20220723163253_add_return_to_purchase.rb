class AddReturnToPurchase < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :return_id, :integer
    add_column :purchases, :return_image, :string
    add_column :purchases, :return_price, :integer
    add_column :purchases, :return_name, :string
    add_column :purchases, :return_introduction, :text
  end
end
