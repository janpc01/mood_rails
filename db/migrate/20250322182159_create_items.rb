class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.text :content
      t.integer :position_x
      t.integer :position_y
      t.integer :width
      t.integer :height
      t.string :file
      t.string :link
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
