class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #enforce uniqueness at database level
    add_index(:users, :email, unique: true)
  end
end
