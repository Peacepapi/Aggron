require "test_helper"

class ToolTest < ActiveSupport:: TestCase

	def setup 
		@tool = Tool.new(name: "Drill", description: "Yo, this things really work.")
	end

	test "user_id should be present" do
		@tool.user_id = nil
		assert_not @tool.valid?
	end

	test "name should be present" do
		@tool.name = " "
		assert_not @tool.valid?
	end

	test "name should not be too long" do
		@tool.name = "a" * 101
		assert_not @tool.valid?
	end

	test "name should not be too short" do
		@tool.name = "a" * 3
		assert_not @tool.valid?
	end

	test "description should be present" do
		@tool.description = " "
		assert_not @tool.valid?
	end

	test "description should not be too long" do
		@tool.description = "a" *  255
		assert_not @tool.valid?
	end

	test "description should not be too short" do
		@tool.description = "a" *  9
		assert_not @tool.valid?
	end

end