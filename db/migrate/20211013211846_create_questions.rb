class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :question_type

      t.timestamps
    end
  end
end
