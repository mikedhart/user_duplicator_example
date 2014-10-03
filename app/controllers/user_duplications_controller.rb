class UserDuplicationsController < ApplicationController
	def create
		user_duplication = UserDuplication.new
		user_duplication.original_user_id = params[:original_user_id]
		user_duplication.save

		redirect_to users_path
	end
end

