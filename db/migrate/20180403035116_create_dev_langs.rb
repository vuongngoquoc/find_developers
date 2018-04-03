class CreateDevLangs < ActiveRecord::Migration[5.1]
  def change
    create_table :dev_langs do |t|
      t.references :developers, foreign_key: true
      t.references :languages, foreign_key: true

      t.timestamps
    end
  end
end
