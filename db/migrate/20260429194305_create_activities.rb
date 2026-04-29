class CreateActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.date :date
      t.integer :people_impacted
      t.decimal :hours
      t.text :notes
      t.references :organization, null: false, foreign_key: true
      t.references :activity_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
