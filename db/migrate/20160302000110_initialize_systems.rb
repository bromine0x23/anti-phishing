class InitializeSystems < ActiveRecord::Migration
	def up
		System.create([
			{ code: 'other', name: '其它' },
			{ code: 'iOS', name: '苹果' },
			{ code: 'Android', name: '安卓' },
			{ code: 'Windows', name: 'Windows' },
		])
	end

	def down
		System.destroy_all
	end
end
