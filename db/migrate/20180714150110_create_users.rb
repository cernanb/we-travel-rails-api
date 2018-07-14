class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_country

      t.timestamps
    end
  end
end
