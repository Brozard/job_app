class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :location
      t.string :industry

      t.timestamps null: false
    end
  end
end
