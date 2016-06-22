class ReportsController < ApplicationController

	layout false

	def create
		if can? :create, Report
			parameters = params.require(:report).require(:create).permit(*%i(url loss region origin_id way_id system_id browser_id))
			parameters.reject! { |_key, value| value.blank? }
			@report = Report.new parameters
			@report.disposer = current_user
			@report.report_time = @report.found_time = Time.current
		else
			head :forbidden
		end
	end

	def index
		if can? :read, Report
			parameters = params.require(:report).require(:index).permit(*%i(start end status_id origin_id))
			parameters.reject! { |_key, value| value.blank? }
			conditions = { report_time: index_report_time(parameters[:start], parameters[:end]) }
			conditions[:status_id] = parameters[:status_id] if parameters[:status_id]
			conditions[:origin_id] = parameters[:origin_id] if parameters[:origin_id]
			@reports = Report.where(conditions)
		else
			head :forbidden
		end
	end

	def show
		if can? :read, Report
			@report = Report.find(params[:id])
		else
			head :forbidden
		end
	end

	def update
		if can? :update, Report
			@report = Report.find(params[:id])
			@report.update params.require(:report).permit(:url)
		else
			head :forbidden
		end
	end

	def confirm
		if can? :confirm, Report
			@report = Report.find(params[:report_id])
			ReportConfirmJob.perform_now @report, current_user
		else
			head :forbidden
		end
	end

	def ignore
		if can? :ignore, Report
			@report = Report.find(params[:report_id])
			ReportIgnoreJob.perform_now @report, current_user
		else
			head :forbidden
		end
	end

	private

	def index_report_time(start_time, end_time)
		if start_time
			start_time = Time.parse(start_time)
			start_time..(end_time ? Time.parse(end_time) : start_time + 14.days)
		else
			end_time = end_time ? Time.parse(end_time) : Time.current
			(end_time - 14.day)..end_time
		end
	end
end
