# frozen_string_literal: true

class CreateVisualizations < ActiveRecord::Migration[5.0]
  def change
    create_table :visualizations do |t|
      t.references :user, foreign_key: true
      t.references :dataset, foreign_key: true
      t.string :color

      t.timestamps
    end
  end
end
