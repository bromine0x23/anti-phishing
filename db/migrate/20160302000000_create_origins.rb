class CreateOrigins < ActiveRecord::Migration
	def change
		create_table :origins, comment: '数据来源' do |t|
			t.string :code, null: false, comment: '内部引用代码'
			t.string :name, comment: '显示名字'
			t.index :code, unique: true
		end
	end
end
