require 'test_helper'

class FrameControllerTest < ActionController::TestCase
	test 'should get reports' do
		get :reports
		assert_response :success
	end

	test 'should get users' do
		get :users
		assert_response :success
	end

	test 'should get whites' do
		get :whites
		assert_response :success
	end
end
