class InitializeOrigins < ActiveRecord::Migration
	def up
		Origin.create([
			{ code: 'staff', name: '安全室值班人' },
			{ code: 'cmb', name: '自主发现' },
			{ code: 'cncert', name: 'CNCERT' },
			{ code: 'tencent', name: '腾讯手机管家' },
			{ code: 'baidu', name: '百度安全卫士' },
			{ code: '360', name: '360安全卫士' },
		])
	end

	def down
		Origin.destroy_all
	end
end
