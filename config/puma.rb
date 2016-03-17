min_threads = ENV.fetch('RAILS_MIN_THREADS') { 2 }.to_i
max_threads = ENV.fetch('RAILS_MAX_THREADS') { 8 }.to_i
threads min_threads, max_threads

port ENV.fetch('PORT') { 3000 }

environment ENV.fetch('RAILS_ENV') { 'development' }