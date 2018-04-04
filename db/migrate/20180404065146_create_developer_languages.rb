class CreateDeveloperLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_languages do |t|
      t.references :developer, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
    add_index :developer_languages,
              %i[developer_id language_id],
              unique: true,
              name: 'idx_developer_languages'
  end
end
