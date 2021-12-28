class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    change_table :patients do |t|
      t.rename :second_name, :last_name 
    end
  end
end
