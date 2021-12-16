class ChangePatientAndPhysiciansTablesAddDiagnosisItem < ActiveRecord::Migration[6.1]
  def change
    change_table :physicians do |t|
      t.rename :name, :first_name 
      t.string :last_name
      t.string :phone_number
      t.string :level
    end

    change_table :patients do |t|
      t.rename :name, :first_name
      t.string :last_name
      t.integer :age
      t.string :email
    end

    create_table :diagnosis_items do |t|
      t.string :content
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end
  end
end
