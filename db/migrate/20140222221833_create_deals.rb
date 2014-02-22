class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :destinationCity
      t.string :departDate
      t.string :returnDate
      t.decimal :minTotalRate
      t.string :dealCarrier
      t.integer :word_id

      t.timestamps
    end
  end
end
