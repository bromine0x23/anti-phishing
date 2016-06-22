class InitializeOrigins < ActiveRecord::Migration
	def up
		Origin.create([
			{ code: 'staff', name: '安全室值班人' },
			{ code: 'cmb', name: '自主发现' },
			{ code: 'cncert', name: 'CNCERT' },
			{ code: 'tencent', name: '腾讯接口' },
			{ code: '360', name: '360接口' },
			{ code: 'baidu', name: '百度接口' },
		])
	end

	def down
		Origin.destroy_all
	end
end
