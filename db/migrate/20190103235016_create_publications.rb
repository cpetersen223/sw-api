class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :body
      t.date :date
      t.time :time
      t.references :author, foreign_key: true

      t.timestamps
    end
    add_index :publications, :title
  end
end
