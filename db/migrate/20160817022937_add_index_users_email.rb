class AddIndexUsersEmail < ActiveRecord::Migration
  def change
   add_index :users, :email, unique: true 
  end
end
