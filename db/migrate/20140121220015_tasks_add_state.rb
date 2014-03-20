class TasksAddState < ActiveRecord::Migration
	def change
		add_column :tasks, :state, :string, :default => "unfinished"
	end
end