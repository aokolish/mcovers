require 'spec_helper'

describe "Galleries" do
  describe "initial page" do
    it "has some content" do
      visit gallery_path
      page.should have_content('Our Favorite Pictures')
      page.should have_content('Gallery')

      page.should have_css('#header')
      page.should have_css('#footer')
    end
    
    it "has thumbs that link to images" do
      get gallery_path
      
      assert_select ".content-wrap a" do |images|
        images.each do |img|
          puts "#{img}\n"
        end
      end
      
      # visit gallery_path
      # puts page.find('.content-wrap').all('img')
    end
  end
  
  describe "light box plugin should work" do 
    
  end
end
