class StaticController < ApplicationController
  caches_page :index, :construction, :gallery, :distributors, :sizes, :custom   
  require 'yaml'
  
  # TODO: get rounded corners working in older versions of IE
  # there has to be a reasonable way of doing this
    
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
    @distributors = YAML.load_file("#{RAILS_ROOT}/config/distributors.yml").values.sort do |x, y|                                                                                         
      x['name'].sub(/^(the|a|an)\s/i, '') <=> y['name'].sub(/^(the|a|an)\s/i, '')    
    end
  end

  def sizes
    @title = 'sizes'
    @sizes = YAML.load_file("#{RAILS_ROOT}/config/sizes.yml").sort {|a,b| a[0]<=>b[0]}
    
    #done with the keys, just need them for the purpose of sorting my hash
    #flatten array, then pull out the even values (the hashes)
    @sizes = @sizes.flatten   
    @sizes = @sizes.values_at(*(1...@sizes.size).step(2))
  end

  def custom
    @title = 'custom'
  end

end
