class CreateLoans < ActiveRecord::Migration
  def change
      create_table :loans do |t|
      t.string :loans
      t.integer :user_id
      t.integer :student_id
      t.integer :book_id
    end
  end
end
