class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :title
      t.text :description
      t.decimal :amountneed
      t.decimal :amountraised, default: 0, null: false

      t.timestamps null: false
    end
  end
end
