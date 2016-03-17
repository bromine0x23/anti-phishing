class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username
			t.string :password
			t.string :name
			t.string :telephone
			t.string :email
			t.boolean :on_duty, default: false

			t.timestamps null: false
		end

		add_index :users, [:username, :password], unique: true
	end
end
