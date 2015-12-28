require 'test_helper'

class UserTest < ActiveSupport::TestCase
 	test "a user should enter a first name" do 
	user = User.new
	assert !user.save
	# asserting that the first name is not empty 
	assert !user.errors[:first_name].empty? 
 	end 

  	test "a user should enter a last name" do 
	user = User.new
	assert !user.save
	# asserting that the first name is not empty 
	assert !user.errors[:last_name].empty? 
 	end 
 
 	test "a user should have a unique profile name" do 
 	user = User.new
 	user.profile_name = 'cynthiasalinas'
 	user.first_name = 'cynthia'
 	user.last_name = 'salinas'
 	user.email= 'cynthia@email.com'
 	user.password = 'password'
 	user.password_confirmation = 'password'

 	assert !user.save
 	assert !user.errors[:profile_name].empty? 
    end

    test "a user should have a profile name without spaces" do 
    user = User.new(first_name: 'Cynthia', last_name: 'Salinas', email:'cynthia2@email.com')
	user.password = user.password_confirmation = 'asdfasdf'	
	
    user.profile_name = "My Profile with Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty? 
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile name" do 
		user = User.new(first_name: 'Cynthia', last_name: 'Salinas', email:'cynthia2@email.com')
		user.password = user.password_confirmation = 'asdfasdf'

		user.profile_name = 'cynthiasalinas_1'
		assert user.valid? 
	end 
end

