class CreateHansols < ActiveRecord::Migration
  def change
    create_table :hansols do |t|

      t.timestamps null: false
    end
  end
end
