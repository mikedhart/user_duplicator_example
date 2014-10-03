class UserDuplication < BaseDuplication
	attributes :original_user_id

	before_duplication do
		@new_user.full_name = @new_user.full_name + " (duplicate)"
	end

	def save
		original_user = User.find(original_user_id)

		if (original_user.present?) then
			@new_user = User.new(original_user.attributes.except!("id"))

			run_callbacks(:duplication) do
				@new_user.save
			end
		end

		false
	end

	def duplication_user
		@new_user
	end
end
