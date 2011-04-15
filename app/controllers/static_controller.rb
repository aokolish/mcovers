class StaticController < ApplicationController
  caches_page :index, :construction, :gallery, :distributors, :sizes, :custom   
  require 'yaml'
    
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
    @distributors = YAML.load_file("#{RAILS_ROOT}/config/distributors.yml")
    @distributors = @distributors.sort do |x, y|                                   
      x[1]['name'].sub(/^(the|a|an)\s/i, '') <=> y[1]['name'].sub(/^(the|a|an)\s/i, '')    # sort them by their names (ignoring some words like 'the')  
    end
  end

  def sizes
    @title = 'sizes'
  end

  def custom
    @title = 'custom'
  end

end
