class CreateComapnies < ActiveRecord::Migration
  def change
    create_table :comapnies do |t|
      t.string :name
      t.string :location
      t.string :industry

      t.timestamps null: false
    end
  end
end
