class CreateDatasets < ActiveRecord::Migration[5.0]
  def change
    create_table :datasets do |t|
      t.text :name, null: false
      t.numeric :year, null: false
      t.text :resource, null: false

      t.timestamps
    end
  end
end
