require 'test_helper'
class UserDuplicationTest < ActiveSupport::TestCase
	test "UserDuplication has original_user_id attributes" do
		original_user = create_original_user

		duplication_user = UserDuplication.new
		duplication_user.original_user_id = original_user.id

		assert_equal(original_user.id, duplication_user.original_user_id)
	end

	test "UserDuplication can duplicate an existing user and assign it a new id and add (duplicate) to the name" do
		original_user = create_original_user

		duplication_user = UserDuplication.new
		duplication_user.original_user_id = original_user.id
		duplication_user.save

		assert_equal(original_user.email, duplication_user.duplication_user.email)
		assert_equal(original_user.admin, duplication_user.duplication_user.admin)
		assert_equal("#{ original_user.full_name } (duplicate)", duplication_user.duplication_user.full_name)
	end

	def create_original_user
		User.create!(full_name: "John Smith", email: "john@smith.com", admin: true)
	end
end
