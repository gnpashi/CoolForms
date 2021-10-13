class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
