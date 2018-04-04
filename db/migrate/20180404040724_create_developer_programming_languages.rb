class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_programming_languages do |t|
      t.references :developer, foreign_key: true, index: {name: 'idx_developer'}
      t.references :programming_language, foreign_key: true, index: {name: 'idx_programming_language'}

      t.timestamps
    end

    add_index :developer_programming_languages,
              %i[developer_id programming_language_id],
              unique: true,
              name: 'idx_developer_programming_languages'
  end
end
