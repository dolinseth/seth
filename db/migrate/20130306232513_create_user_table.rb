class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamps
    end

    add_column :tasks, :user_id, :integer
  end
end
