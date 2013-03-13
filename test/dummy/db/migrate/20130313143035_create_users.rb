class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fisrt_name
      t.string :last_name

      t.timestamps
    end
  end
end
