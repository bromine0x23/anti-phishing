class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users, comment: '用户' do |t|
			t.string :username, null: false, comment: '用户名'
			t.string :password, null: false, comment: '密码'
			t.string :name, comment: '姓名'
			t.string :telephone, comment: '电话'
			t.string :email, comment: '邮箱'
			t.boolean :on_duty, null: false, default: false, comment: '是否值班'
			t.timestamps null: false
		end
		add_index :users, [:username, :password], unique: true
	end
end
