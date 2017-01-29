class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :message
      t.string :string,
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
