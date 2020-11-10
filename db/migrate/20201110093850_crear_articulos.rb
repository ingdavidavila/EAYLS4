class CrearArticulos < ActiveRecord::Migration[6.0]
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :cuerpo
      t.datetime :created_at
      t.datetime :updated_at
      t.string :categoria
      t.integer :user_id
    end
  end
end
