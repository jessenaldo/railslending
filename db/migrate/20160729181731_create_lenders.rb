class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.decimal :balance

      t.timestamps null: false
    end
  end
end