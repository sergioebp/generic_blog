class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.integer :value
      t.references :rateable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
