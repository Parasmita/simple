class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :code
      t.integer :strength
      t.string :website

      t.timestamps
    end
  end
end
