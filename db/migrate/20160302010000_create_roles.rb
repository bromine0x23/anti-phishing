class CreateRoles < ActiveRecord::Migration
	def change
		create_table :roles, comment: '角色' do |t|
			t.string :code, null: false, comment: '内部引用代码'
			t.string :name, comment: '显示名字'
			t.index :code, unique: true
			t.timestamps null: false
		end
	end
end
