SimpleForm.setup do |config|
	config.wrappers :vertical_select2, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
		b.use :html5
		b.use :placeholder
		b.optional :min_max
		b.optional :readonly
		b.use :label, class: 'control-label'

		b.use :input, class: 'select2'
		b.use :error, wrap_with: {tag: 'span', class: 'help-block'}
		b.use :hint, wrap_with: {tag: 'p', class: 'help-block'}
	end

	config.wrappers :inline_select2, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
		b.use :html5
		b.use :placeholder
		b.optional :min_max
		b.optional :readonly
		b.use :label, class: 'sr-only'

		b.use :input, class: 'select2'
		b.use :error, wrap_with: {tag: 'span', class: 'help-block'}
		b.use :hint, wrap_with: {tag: 'p', class: 'help-block'}
	end

	config.wrappers :vertical_datetime_picker, tag: 'div', class: 'input-group date-time-picker', error_class: 'has-error' do |b|
		b.use :html5
		b.use :placeholder
		b.optional :readonly
		b.use :label, class: 'control-label'

		b.use :input, class: 'form-control'
		b.use :error, wrap_with: {tag: 'span', class: 'help-block'}
		b.use :hint, wrap_with: {tag: 'p', class: 'help-block'}
	end

	config.wrappers :inline_datetime_picker, tag: 'div', class: 'input-group date-time-picker', error_class: 'has-error' do |b|
		b.use :html5
		b.use :placeholder
		b.optional :readonly
		b.use :label, class: 'sr-only'

		b.use :input, class: 'form-control datetime-picker'
		b.use :error, wrap_with: {tag: 'span', class: 'help-block'}
		b.use :hint, wrap_with: {tag: 'p', class: 'help-block'}
	end
end