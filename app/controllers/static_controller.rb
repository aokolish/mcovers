class StaticController < ApplicationController
  caches_page :index, :construction, :gallery, :distributors, :sizes, :custom   
    
  def index
    @title = 'home'
    #TODO: put keywords here for SEO
    @keywords = ''  
  end

  def construction
    @title = 'construction'
  end

  def gallery
    @title = 'gallery'
  end

  def distributors
    @title = 'distributors'
  end

  def sizes
    @title = 'sizes'
  end

  def custom
    @title = 'custom'
  end

end
