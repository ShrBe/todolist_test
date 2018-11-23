class CreateTodoListAs < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_list_as do |t|
      t.string :content

      t.timestamps
    end
  end
end
