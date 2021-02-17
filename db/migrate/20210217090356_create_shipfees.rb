class CreateShipfees < ActiveRecord::Migration[6.0]
  def change
    create_table :shipfees do |t|

      t.timestamps
    end
  end
end
