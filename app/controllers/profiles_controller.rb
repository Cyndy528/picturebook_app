class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])
  	# conditional logic 
  	if @user 
  		# scoping 
  		@statuses = @user.statuses.all 
  		render action: :show
  	else 
		render file 'public/404', status: 404, formats: [:html]
	end 
  end

end 