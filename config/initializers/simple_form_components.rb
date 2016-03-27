module SimpleForm
	module Components
		module Placeholders
			def placeholder_with_select2(wrapper_options = nil)
				if select2?
					input_html_options[:'data-placeholder'] ||= placeholder_text
					nil
				else
					placeholder_without_select2(wrapper_options)
				end
			end
			alias_method_chain :placeholder, :select2

			private

			def select2?
				input_type == :select2
			end
		end
	end
end