class InitializeBrowsers < ActiveRecord::Migration
	def up
		Browser.create([
			{ code: 'other', name: '其它' },
			{ code: 'IE', name: 'IE浏览器' },
			{ code: 'Firefox', name: '火狐浏览器' },
			{ code: 'Chrome', name: '谷歌浏览器' },
			{ code: 'QQ', name: 'QQ浏览器' },
			{ code: '360', name: '360浏览器' },
			{ code: 'Maxthon', name: '遨游浏览器' },
		])
	end

	def down
		Browser.destroy_all
	end
end
