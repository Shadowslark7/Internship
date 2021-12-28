class ChangePatientAndPhysiciansTablesAddDiagnosisItem < ActiveRecord::Migration[6.1]
  def change
    change_table :physicians do |t|
      t.rename :name, :first_name 
      t.string :last_name, null: false, default: "No last name"
      t.string :phone_number, null: false, default: "+38000000000"
      t.string :level, null: false, default: "junior"
    end

    change_table :patients do |t|
      t.rename :name, :first_name
      t.string :second_name, null: false, default: "No last name"
      t.integer :age, null: false, default: "1"
      t.string :email, null: false, default: "No email"
    end

    create_table :diagnosis_items do |t|
      t.string :content, null: false, default:"Be healthy"
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end

    change_column_default :patients, :first_name, from: nil, to: "No first name"
    change_column_null :patients, :first_name, false

    change_column_default :physicians, :first_name, from: nil, to: "No first name"
    change_column_null :physicians, :first_name, false
  end
end
