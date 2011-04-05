require 'test_helper'

class RoutingTest < ActionController::TestCase
  
  def test_static_routing
    # ActionController::Routing.use_controllers! ["static"]
    load "config/routes.rb"
    
    assert_routing("/construction", :controller => "static", :action => "construction")
    assert_routing("/gallery", :controller => "static", :action => "gallery")
    assert_routing("/distributors", :controller => "static", :action => "distributors")
    assert_routing("/sizes", :controller => "static", :action => "sizes")
    assert_routing("/custom", :controller => "static", :action => "custom")
    assert_routing("/", :controller => "static", :action => "index")
  end
end