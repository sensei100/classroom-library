class ChangeColumnNameLoans < ActiveRecord::Migration
  def change
    rename_column :loans, :loans, :name
  end
end
