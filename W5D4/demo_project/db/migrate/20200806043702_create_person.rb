class CreatePerson < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
    name.string :name, null: false
    house_id.integer :house_id, null: false
    end
  end
end
