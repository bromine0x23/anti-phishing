class InitializeStatuses < ActiveRecord::Migration
	def up
		Status.create([
			{ code: 'pending', name: '待处理' },
			{ code: 'reported', name: '已申报' },
			{ code: 'accepted', name: '已受理', remark: 'CNCERT' },
			{ code: 'rejected', name: '未受理', remark: 'CNCERT' },
			{ code: 'closed', name: '已处理', remark: 'CNCERT' },
			{ code: 'false', name: '误报' },
		])
	end

	def down
		Status.destroy_all
	end
end
