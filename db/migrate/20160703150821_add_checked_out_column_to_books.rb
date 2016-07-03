class AddCheckedOutColumnToBooks < ActiveRecord::Migration
  def change
     add_column :books, :checked_out, :string
  end
end
