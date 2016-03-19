class Ability
	include CanCan::Ability

	# @param [User] user
	def initialize(user)
		@user = user || User.new
		staff if @user.staff?
		manager if @user.manager?
		administrator if @user.administrator?
	end

	private

	def staff
		can %i(create read), Report
		can :work,           User
		can :export,         Report # 导出数据
		can :update_url,     Report # 修改URL
		can :report_false,   Report # 误报
		can :report_close,   Report # 关闭
	end

	def manager
		can :manage, White
		can :check,  Report # 查看数据报表
	end

	def administrator
		can :manage, User
		can :manage, Role
	end
end
