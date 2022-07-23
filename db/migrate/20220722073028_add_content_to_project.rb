class AddContentToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :content, :string
  end
end
