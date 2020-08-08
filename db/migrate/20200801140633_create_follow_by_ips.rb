class CreateFollowByIps < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_by_ips do |t|
      t.references :word, null: false, foreign_key: true
      t.string :ip

      t.timestamps
    end
  end
end
