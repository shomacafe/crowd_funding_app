class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :message

      t.timestamps
    end
  end
end
