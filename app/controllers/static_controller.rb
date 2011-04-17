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
    @distributors = @distributors.values.sort do |x, y|                              #in this case, the keys are meaningless. just want the values.                                                           
      x['name'].sub(/^(the|a|an)\s/i, '') <=> y['name'].sub(/^(the|a|an)\s/i, '')    # sort them by their names (ignoring some words like 'the')  
    end
  end

  def sizes
    @title = 'sizes'
  end

  def custom
    @title = 'custom'
  end

end
