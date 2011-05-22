class StaticController < ApplicationController
  caches_page :index, :construction, :gallery, :distributors, :sizes, :custom   
  require 'yaml'
    
  def index
    @title = 'home'
    @header = 'Bass Bags Built To Last'
    #TODO: put keywords here for SEO
    # @keywords = ''  
  end

  def construction
    @header = 'Product Construction'
  end

  def gallery
    @thumbs = Thumbnail.all
  end

  def distributors
    @distributors = Distributor.all
  end

  def sizes
    @sizes = Size.all
  end

  def custom
    @header = 'Custom Bags'
  end

end
