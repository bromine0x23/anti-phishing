require 'uri'

class UrlValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		url = URI(value)
		unless url.is_a? URI::HTTP and url.host
			record.send "#{attribute}=", nil
			record.errors.add(attribute, :invalid, options)
		end
	rescue URI::InvalidURIError, ArgumentError # => error
		record.errors.add(attribute, :invalid, options)
	end
end