require "application_system_test_case"

class AvailabilityBlocksTest < ApplicationSystemTestCase
  setup do
    @availability_block = availability_blocks(:one)
  end

  # test "visiting the index" do
  #   visit availability_blocks_url
  #   assert_selector "h1", text: "Availability Blocks"
  # end

  # test "creating a Availability block" do
  #   visit availability_blocks_url
  #   click_on "New Availability Block"

  #   fill_in "Coach", with: @availability_block.coach_id
  #   fill_in "Day", with: @availability_block.day
  #   fill_in "End time", with: @availability_block.end_time
  #   fill_in "Start time", with: @availability_block.start_time
  #   click_on "Create Availability block"

  #   assert_text "Availability block was successfully created"
  #   click_on "Back"
  # end

  # test "updating a Availability block" do
  #   visit availability_blocks_url
  #   click_on "Edit", match: :first

  #   fill_in "Coach", with: @availability_block.coach_id
  #   fill_in "Day", with: @availability_block.day
  #   fill_in "End time", with: @availability_block.end_time
  #   fill_in "Start time", with: @availability_block.start_time
  #   click_on "Update Availability block"

  #   assert_text "Availability block was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Availability block" do
  #   visit availability_blocks_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Availability block was successfully destroyed"
  # end
end
