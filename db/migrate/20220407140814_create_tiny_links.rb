class CreateTinyLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :tiny_links do |t|
      t.string :short_url
      t.integer :clicks
      t.references :upload, null: false, foreign_key: true

      t.timestamps
    end
  end
end
