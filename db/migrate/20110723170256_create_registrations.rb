class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :name
      t.string :credential_name
      t.string :rg
      t.string :cpf
      t.date :dob
      t.string :zip_code
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :district
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :mobile
      t.string :email
      t.integer :how_known
      t.string :unit
      t.string :unit_zip_code
      t.string :unit_address
      t.string :unit_address_number
      t.string :unit_address_complement
      t.string :unit_district
      t.string :unit_city
      t.string :unit_state
      t.string :unit_phone
      t.string :unit_fax
      t.boolean :disabilities
      t.boolean :send_any_work
      t.boolean :student
      t.integer :status
      t.integer :mode_of_payment
      t.string :total_hours_mandatory
      t.float :value
      t.integer :notificator_status
      t.string :disability_desc
      t.string :segment
      t.string :employee_id
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
