class RemoveCheckOutCloumnFromStudents < ActiveRecord::Migration
  def change
    change_table(:students) do |t|
      t.remove :checked_out
    end
  end
end
