class CreateSystems < ActiveRecord::Migration
	def change
		create_table :systems, comment: '操作系统类型' do |t|
			t.string :code, null: false, comment: '内部引用代码'
			t.string :name, comment: '显示名字'
			t.index :name, unique: true
		end
	end
end
