class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :original
      t.belongs_to :link, foreign_key: true

      t.timestamps
    end
  end
end
