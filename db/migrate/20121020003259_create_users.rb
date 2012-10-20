class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.string :prompt
      t.string :bid

      t.timestamps
    end
  end
end
