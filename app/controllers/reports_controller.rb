class ReportsController < ApplicationController

	layout false

	def create
		report = Report.new params.require(:create).permit(*%i(url loss region origin_id way_id system_id browser_id)) do |report|
			report.status = Status.find_by(code: 'pending')
			report.disposer = session[:user]
			report.report_time = report.found_time = Time.current
		end
		result =
			if report.save
				ScreenshotJob.perform_later report
				{ status: true, message: '录入成功' }
			else
				{ status: false, message: '校验失败' }
			end
		respond_to do |format|
			format.json { render json: result }
			format.xml  { render xml: result }
		end
	end

	def index
		parameters = params.require(:index).permit(*%i(start_time end_time status_id origin_id))
		parameters.reject! { |_key, value| value.blank? }
		conditions = {}
		conditions[:report_time] =
			if parameters[:start_time]
				if parameters[:end_time]
					parameters[:start_time]..parameters[:end_time]
				else
					Time.parse(parameters[:start_time])..(Time.parse(parameters[:start_time]) + 14.days)
				end
			else
				if parameters[:end_time]
					(Time.parse(parameters[:end_time]) - 14.days)..Time.parse(parameters[:end_time])
				else
					(Time.current - 14.day)..Time.current
				end
			end
		# conditions[:report_time] = (parameters[:start_time]  || Time.now - 3.day)..(parameters[:end_time] || Time.now)
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
end
