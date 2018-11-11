require "application_system_test_case"

class BranchdirectorsTest < ApplicationSystemTestCase
  setup do
    @branchdirector = branchdirectors(:one)
  end

  test "visiting the index" do
    visit branchdirectors_url
    assert_selector "h1", text: "Branchdirectors"
  end

  test "creating a Branchdirector" do
    visit branchdirectors_url
    click_on "New Branchdirector"

    click_on "Create Branchdirector"

    assert_text "Branchdirector was successfully created"
    click_on "Back"
  end

  test "updating a Branchdirector" do
    visit branchdirectors_url
    click_on "Edit", match: :first

    click_on "Update Branchdirector"

    assert_text "Branchdirector was successfully updated"
    click_on "Back"
  end

  test "destroying a Branchdirector" do
    visit branchdirectors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Branchdirector was successfully destroyed"
  end
end
