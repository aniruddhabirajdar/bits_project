class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :symbol_name

      t.timestamps
    end

    create_table :users_roles do |t|
      t.integer :user_id
      t.integer :role_id
    end

  end
end
