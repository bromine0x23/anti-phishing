class CreateReports < ActiveRecord::Migration
	def change
		create_table :reports, comment: '报告' do |t|
			t.string :url, null: false, comment: '钓鱼网站网址'

			t.string :loss, default: '0', comment: '损失'
			t.string :region

			t.references :origin, foreign_key: true, null: false, comment: '数据来源引用'

			t.references :way, foreign_key: true, comment: '传播方式引用'
			t.references :system, foreign_key: true, comment: '操作系统类型引用'
			t.references :browser, foreign_key: true, comment: '浏览器类型引用'

			t.integer :disposer_id, null: false, comment: '处理人引用'
			t.foreign_key :users, column: :disposer_id

			t.references :status, default: Status.find_by(code: 'pending'), foreign_key: true, null: false, comment: '状态引用'

			t.timestamp :found_time, null: false, comment: '发现时间'
			t.timestamp :report_time, null: false, comment: '报告时间'
			t.timestamp :dispose_time, comment: '处理时间'
			t.timestamp :finish_time, comment: '结束时间'

			t.binary :screenshot, limit: 1.megabyte, comment: '截图'

			t.timestamps null: false
		end
	end
end
