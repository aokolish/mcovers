class StaticController < ApplicationController
  caches_page :index, :construction, :gallery, :distributors, :sizes, :custom   
    
  def index
  end

  def construction
  end

  def gallery
  end

  def distributors
  end

  def sizes
  end

  def custom
  end

end
