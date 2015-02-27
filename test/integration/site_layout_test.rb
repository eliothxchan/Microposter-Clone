require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    
    #Go to root path
    get root_path
    
    #Ensure that we're displaying home page
    assert_template 'static_pages/home'
    
    #Check that there are two links to the home page
    assert_select "a[href=?]", root_path, count: 2
    
    #Check that there is a help path
    assert_select "a[href=?]", help_path
    
    #Check that there is an about path
    assert_select "a[href=?]", about_path
    
    #Check that there is a contact path
    assert_select "a[href=?]", contact_path
  end
end