require 'spec_helper'
require 'capybara/dsl'
require 'capybara/rspec'
# require 'capybara/rspec/matchers'

describe "Customs", :type => :request do 
  describe "GET /customs" do    
    
    Capybara.add_selector(:row) do
      xpath { |num| ".//tbody/tr[#{num}]" }
    end
    
    describe "initial state of the page" do
      it "should have some content" do
        visit custom_path
        page.should have_content('Our Customs')
        page.should have_content('Features')
        page.should have_content('Prices')
        page.should have_content('Stock Colors')

        page.should have_css('#header')
        page.should have_css('#footer')
      end

      it "should have the default size checked" do
        visit custom_path
        page.should have_checked_field('three_quarter')
      end

      it "should have unchecked options" do
        visit custom_path      
        page.should have_unchecked_field('full_size')      
        page.should have_unchecked_field('custom_color')
        page.should have_unchecked_field('custom_pockets')      
      end

      it "should have default prices visible" do
        visit custom_path

        page.find('td', :text => '$470').should be_visible
        page.find(:row, 5).should have_content('$470')      
      end

      it "should start with some hidden prices", :js => true do
        visit custom_path

        # these are prices associated with unselected custom bag options
        page.find(:row, 2).find('td:last-child').should_not be_visible
        page.find(:row, 3).find('td:last-child').should_not be_visible
        page.find(:row, 4).find('td:last-child').should_not be_visible

      end
    end
    
    describe "javasript interaction" do 
      # it "should toggle price visibility when options are checked", :js => true do 
      #   visit custom_path
      # 
      #   @custom_color_price = page.find(:row, 3).find('td:last-child')
      #   @custom_pockets_price = page.find(:row, 3).find('td:last-child')
      #   @full_size_price = page.find(:row, 3).find('td:last-child')
      # 
      #   page.check('custom_color')
      #   @custom_color_price.should be_visible
      # 
      #   page.uncheck('custom_color')
      #   puts "unchecked"
      #   puts "checked = #{@custom_color_price.checked?}"
      #   puts "visible = #{@custom_color_price.visible?}"
      #   # @custom_color_price.should_not be_visible
      # 
      #   page.check('custom_pockets')
      #   @custom_pockets_price.should be_visible
      # 
      #   choose('full_size')
      #   # @full_size_price.should be_visible    
      # 
      # end
      # 
      it "should have a default price" do
        visit custom_path
        
        # form defaults to having one options selected (3/4 size)
        # the price of this option should be equal to the number listed as the total price
        price_of_selected = page.find(:row, 1).find('td:last-child').text.sub(/\?|\$/, '').to_i
        total_price = page.find(:row, 5).find('td').text.sub(/\?|\$/, '').to_i
        
        assert_equal price_of_selected, total_price
        
      end
      
      it "should add up the price as you change options", :js => true do 
        visit custom_path
        
        page.check('custom_color')
        price_of_selected = page.find(:row, 1).find('td:last-child').text.sub(/\?|\$/, '').to_i
        price_of_selected += page.find(:row, 3).find('td:last-child').text.sub(/\?|\$/, '').to_i
        total_price = page.find(:row, 5).find('td').text.sub(/\?|\$/, '').to_i
        
        assert_equal price_of_selected, total_price
      end
      
      it "adds tilde to total when custom pockets are selected", :js => true do
        visit custom_path
        
        page.check('custom_pockets')
        page.find(:row, 5).find('td').should have_content('~')
      end
    end
    
  end
end
