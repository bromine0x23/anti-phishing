class Select2Input < SimpleForm::Inputs::CollectionInput
	enable :placeholder

	def input(wrapper_options = nil)
		label_method, value_method = detect_collection_methods

		input_html_options[:'data-placeholder'] ||= options[:placeholder]

		p input_html_classes

		unless required_field?
			input_html_options[:'data-allow-clear'] ||= true
		end

		merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

		@builder.collection_select(
			attribute_name, collection, value_method, label_method,
			input_options, merged_input_options
		)
	end
end