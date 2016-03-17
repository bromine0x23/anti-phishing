class CreateReports < ActiveRecord::Migration
	def change
		create_table :reports do |t|
			t.string :url, null: false

			t.string :loss
			t.string :region

			t.references :origin, foreign_key: true, null: false

			t.references :way, :system, :browser, foreign_key: true

			t.integer :disposer_id, new: true, null: false
			t.foreign_key :users, column: :disposer_id

			t.references :status, foreign_key: true, null: false

			t.timestamp :found_time, :report_time, :dispose_time, :finish_time

			t.binary :screenshot, limit: 16.megabyte

			t.timestamps null: false
		end
	end
end
