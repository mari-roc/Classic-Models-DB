class CreateProductLines < ActiveRecord::Migration[8.1]
  def change
    create_table :product_lines, id: false do |t|
      t.primary_key :product_line, :string, limit: 50
      t.string :text_description, limit: 4000
      t.text :html_description
      t.binary :image
    end
  end
end
