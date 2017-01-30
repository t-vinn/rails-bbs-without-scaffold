class AddThreadIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :my_thread_id, :integer
  end
end
