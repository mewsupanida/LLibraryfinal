class AddUniqueness < ActiveRecord::Migration[6.0]
  def change
    add_index :words, [:term], unique: true, name: 'uniq_term'
  end
end
