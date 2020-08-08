class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :term
      t.text :term_definition
      t.string :term_acronym
      t.string :term_tags
      t.integer :search_count

      t.timestamps
    end
  end
end
