class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :quiz, null: false, foreign_key: true
      t.boolean :multianswer

      t.timestamps
    end
  end
end
