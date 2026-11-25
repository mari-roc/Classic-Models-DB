class CreateOffices < ActiveRecord::Migration[8.1]
  def change
    create_table :offices, id: false do |t|
      t.primary_key :office_code, :string, limit: 10
      t.string :city, null: false, limit: 50
      t.string :phone, null: false, limit: 50
      t.string :address_line_1, null: false, limit: 50
      t.string :address_line_2, limit: 50
      t.string :state, limit: 50
      t.string :country, null: false, limit: 50
      t.string :postal_code, null: false, limit: 15
      t.string :territory, null: false, limit: 10
    end
  end
end
