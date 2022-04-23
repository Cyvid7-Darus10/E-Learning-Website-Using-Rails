class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :content
      t.boolean :is_correct, default: false
      t.integer :word_id

      t.timestamps
    end
  end
end
