# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( sessions.css sessions.js index.css index.js frame.css frame.js )
Rails.application.config.assets.precompile += %w( reports.css reports.js whites.css whites.js user.css user.js )

# Reject duplicate assets from Rails Assets
Rails.application.config.assets.paths.reject! do |path|
	case path
	when %r(rails-assets-jquery-\d\.\d\.\d/)
		true
	when %r(rails-assets-bootstrap-\d\.\d\.\d/)
		true
	else
		false
	end
end