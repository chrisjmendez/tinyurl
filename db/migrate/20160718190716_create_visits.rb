class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :country
      t.belongs_to :link, foreign_key: true

      t.timestamps
    end
  end
end
