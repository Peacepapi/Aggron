require "test_helper"

class UserTest < ActiveSupport:: TestCase
	def setup
		@user = User.new(username: "Pier", email: "pier@you.me")
	end

	test "User should be valid" do
		assert @user.valid?
	end

	test "Username should be present" do
		@user.username = " "
		assert_not @user.valid?
	end

	test "Username should not be too long" do
		@user.username = "a" * 21
		assert_not @user.valid?
	end

	test "Username should not be too short" do
		@user.username = "a" * 3
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = " "
		assert_not @user.valid?
	end

	test "email should be within boundary" do
		@user.email = "a" *  255 + "@exmaple.com"
		assert_not @user.valid?
	end

	test "email should be unique" do
		dup_user = @user.dup 
		dup_user.email = @user.email.upcase
		@user.save
		assert_not dup_user.valid?
	end

	test "email validation should accept valid addresses" do
		#separate each element
		valid_addresses = %w[user564@eee.com RRR_DS-DS@mail.cp user@example.com first.last@eem.au laura+joe@monk.cm]
		valid_addresses.each do |va|
			@user.email = va
			assert @user.valid?, "#{va.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[user@eee,com RRR_DS*-DS@mail.cp first.last@e_e_m.au laurajoe@monk+gp.com]
		invalid_addresses.each do |ia|
			@user.email = ia
			assert_not @user.valid?, "#{ia.inspect} should be invalid"
		end
	end
end