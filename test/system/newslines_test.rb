require "application_system_test_case"

class NewslinesTest < ApplicationSystemTestCase
  setup do
    @newsline = newslines(:one)
  end

  test "visiting the index" do
    visit newslines_url
    assert_selector "h1", text: "Newslines"
  end

  test "creating a Newsline" do
    visit newslines_url
    click_on "New Newsline"

    click_on "Create Newsline"

    assert_text "Newsline was successfully created"
    click_on "Back"
  end

  test "updating a Newsline" do
    visit newslines_url
    click_on "Edit", match: :first

    click_on "Update Newsline"

    assert_text "Newsline was successfully updated"
    click_on "Back"
  end

  test "destroying a Newsline" do
    visit newslines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Newsline was successfully destroyed"
  end
end
