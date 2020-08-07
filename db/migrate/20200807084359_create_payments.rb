class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :mpesa_code
      t.references :user, null: false, foreign_key: true
      t.string :transacted
      t.string :timed_out

      t.timestamps
    end
  end
end
