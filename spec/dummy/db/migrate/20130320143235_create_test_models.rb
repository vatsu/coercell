class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      t.string :title
      t.integer :number
      t.string :item_from_a_list
      t.float :float_number
      t.string :required_field
      t.date :date_field

      t.timestamps
    end
  end
end
