class CreateAvatarElements < ActiveRecord::Migration[6.0]
  def change
    create_table :avatar_elements do |t|
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
