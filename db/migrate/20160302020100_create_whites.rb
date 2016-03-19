class CreateWhites < ActiveRecord::Migration
	def change
		create_table :whites, comment: '白名单' do |t|
			t.string :url, null: false, comment: '网址'
			t.integer :disposer_id, null: false, comment: '处理人'
			t.foreign_key :users, column: :disposer_id
			t.timestamps null: false
			t.index :url, unique: true
		end
	end
end
