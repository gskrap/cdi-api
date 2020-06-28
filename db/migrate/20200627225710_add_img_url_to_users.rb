class AddImgUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :imgUrl, :string
  end
end
