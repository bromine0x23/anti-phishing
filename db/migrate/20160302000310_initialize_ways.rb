class InitializeWays < ActiveRecord::Migration
	def up
		Way.create([
			{ code: 'pseudo-base', name: '伪基站' },
			{ code: 'WeChat', name: '微信' },
			{ code: 'QQ', name: 'QQ' },
			{ code: 'WangWang', name: '阿里旺旺' },
		])
	end

	def down
		Way.destroy_all
	end
end
