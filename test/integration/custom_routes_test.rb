require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
# testing login page 
 test "that /login route opens the login page" do 
 	get '/login'
 	# checking to see if test was successful
 	assert_response :success
 end 
 # testing logout page 
 test "that /logout route opens the log out page" do 
 	get '/logout'
 	# checking to see if test was successful
 	assert_response :redirect 
 	assert_redirected_to '/'
 end 

 # testing register page 
 test "that /register route opens the register page" do 
 	get '/register'
 	# checking to see if test was successful
 	assert_response :success
 end 
end
