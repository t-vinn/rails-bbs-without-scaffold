class AddDetailsToMyThreads < ActiveRecord::Migration[5.0]
  def change
    add_column :my_threads, :user_id, :integer
  end
end
