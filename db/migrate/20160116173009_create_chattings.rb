class CreateChattings < ActiveRecord::Migration
  def change
    create_table :chattings do |t|

      t.integer :user_id
      t.text :content
      t.string :written_time

      t.timestamps null: false
    end
  end
end
