class AddBoughtToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :bought, :boolean, default: false
  end
end
