class DateTimePickerInput < SimpleForm::Inputs::Base
	enable :placeholder

	def input(wrapper_options = nil)

		component_options = { class: 'input-group date-time-picker' }
		component_options[:id] ||= options[:id]
		component_options[:'data-min'] ||= options[:min]
		component_options[:'data-max'] ||= options[:max]
		component_options[:'data-current'] ||= options[:current]

		input_html_options[:'data-date-format'] ||= options[:format]

		merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

		template.content_tag(:div, component_options) do
			template.concat @builder.text_field(attribute_name, merged_input_options)
			template.concat span_calendar
		end
	end

	private

	def span_calendar
		template.content_tag(:span, class: 'input-group-addon') do
			template.concat icon_calendar
		end
	end

	def icon_calendar
		'<span class="fa fa-calendar"></span>'.html_safe
	end
end