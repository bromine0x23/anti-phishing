class FramesController < ApplicationController

	def reports
		head :forbidden unless can? :read, Report
	end

	def whites
		head :forbidden unless can? :manage, White
	end

	def users
		head :forbidden unless can? :manage, User
	end
end
