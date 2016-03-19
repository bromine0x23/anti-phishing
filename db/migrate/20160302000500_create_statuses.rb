class CreateStatuses < ActiveRecord::Migration
	def change
		create_table :statuses, comment: '处理状态' do |t|
			t.string :code, null: false, comment: '内部引用代码'
			t.string :name, comment: '显示名字'
			t.string :remark, comment: '备注'
			t.index :code, unique: true
		end
	end
end
