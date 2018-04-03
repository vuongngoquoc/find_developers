class CreateDevPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :dev_programs do |t|
      t.references :developers, foreign_key: true
      t.references :programming_languages, foreign_key: true

      t.timestamps
    end
  end
end
