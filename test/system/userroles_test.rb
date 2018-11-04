require "application_system_test_case"

class UserrolesTest < ApplicationSystemTestCase
  setup do
    @userrole = userroles(:one)
  end

  test "visiting the index" do
    visit userroles_url
    assert_selector "h1", text: "Userroles"
  end

  test "creating a Userrole" do
    visit userroles_url
    click_on "New Userrole"

    click_on "Create Userrole"

    assert_text "Userrole was successfully created"
    click_on "Back"
  end

  test "updating a Userrole" do
    visit userroles_url
    click_on "Edit", match: :first

    click_on "Update Userrole"

    assert_text "Userrole was successfully updated"
    click_on "Back"
  end

  test "destroying a Userrole" do
    visit userroles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userrole was successfully destroyed"
  end
end
