require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Board", with: @item.board_id
    fill_in "Content", with: @item.content
    fill_in "File", with: @item.file
    fill_in "Height", with: @item.height
    fill_in "Link", with: @item.link
    fill_in "Position x", with: @item.position_x
    fill_in "Position y", with: @item.position_y
    fill_in "Width", with: @item.width
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Board", with: @item.board_id
    fill_in "Content", with: @item.content
    fill_in "File", with: @item.file
    fill_in "Height", with: @item.height
    fill_in "Link", with: @item.link
    fill_in "Position x", with: @item.position_x
    fill_in "Position y", with: @item.position_y
    fill_in "Width", with: @item.width
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    accept_confirm { click_on "Destroy this item", match: :first }

    assert_text "Item was successfully destroyed"
  end
end
