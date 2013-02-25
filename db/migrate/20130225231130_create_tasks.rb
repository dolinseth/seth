class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body
      t.integer :priority
      t.timestamps
    end
  end
end
