require 'spec_helper'

describe "Constructions" do
  describe "GET /constructions" do
    
    describe "initial state of the page" do
      it "has some content" do
        visit construction_path
        
        page.should have_content('Product Construction')        
        page.should have_content('Refined Design')
        page.should have_content('Important Features')
        page.should have_content('Pockets Mounted Sideways')

        page.should have_css('#header')
        page.should have_css('#footer')
      end
    end
    
  end
end
