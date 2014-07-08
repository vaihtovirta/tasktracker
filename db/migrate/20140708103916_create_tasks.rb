class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :state
      t.index :state
      t.timestamps
    end
  end
end
