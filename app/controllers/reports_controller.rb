class ReportsController < ApplicationController

	layout false

	def create
		@report = Report.new params.require(:create).permit(*%i(url loss region origin_id way_id system_id browser_id)) do |report|
			report.disposer = current_user
			report.report_time = report.found_time = Time.current
		end
	end

	def index
		parameters = params.require(:index).permit(*%i(start_time end_time status_id origin_id))
		parameters.reject! { |_key, value| value.blank? }
		conditions = { report_time: index_report_time(parameters[:start_time], parameters[:end_time]) }
		conditions[:status_id] = parameters[:status_id] if parameters[:status_id]
		conditions[:origin_id] = parameters[:origin_id] if parameters[:origin_id]
		@reports = Report.where(conditions)
	end

	def show
		@report = Report.find(params[:id])
	end

	def update
		render json: params
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
