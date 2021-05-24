class AddReferencesToRates < ActiveRecord::Migration[6.1]
  def change
    add_reference :rates, :author, null: false, foreign_key: true
  end
end
