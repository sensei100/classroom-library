class ChangeColumnNameBooksTable < ActiveRecord::Migration
  def change
    rename_column :books, :title, :name
  end
end
