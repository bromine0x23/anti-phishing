class Ability
	include CanCan::Ability

	# @param [User] user
	def initialize(user)
		@user = user || User.new

		if @user.administrator?
			administrator
			manager
			staff
		end

		if @user.manager?
			manager
			staff
		end

		if @user.staff?
			staff
		end
	end

	private

	def staff
		can :work,     User
		can :create,   Report
		can :read,     Report
		can :update,   Report
		can :export,   Report # 导出数据
		can :confirm,  Report # 关闭
		can :ignore,   Report # 误报
		can :create,   Report::Screenshot
		can :update,   Report::Screenshot
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
