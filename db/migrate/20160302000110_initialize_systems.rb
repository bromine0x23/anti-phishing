class InitializeSystems < ActiveRecord::Migration
	def up
		System.create([
			{ code: 'iOS', name: '苹果iOS' },
			{ code: 'android', name: '安卓' },
			{ code: 'Windows', name: 'Windows' },
			{ code: 'Linux', name: 'Linux' },
			{ code: 'OSX', name: 'OSX' },
		])
	end

	def down
		System.destroy_all
	end
end
