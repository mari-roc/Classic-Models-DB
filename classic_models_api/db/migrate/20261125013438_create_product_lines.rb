class CreateProductLines < ActiveRecord::Migration[8.1]
  def change
    create_table :product_lines, id: false do |t|
      t.primary_key :product_line, :string, limit: 50
      t.string :text_description, limit: 4000
      t.string :html_description, limit: 4000
      t.binary :image, limit: 4000
    end
    drop_table :product_lines
  end
end
