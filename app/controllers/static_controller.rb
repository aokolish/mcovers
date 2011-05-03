class StaticController < ApplicationController
  caches_page :index, :construction, :gallery, :distributors, :sizes, :custom   
  require 'yaml'
  before_filter :set_defaults
    
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
    @thumbs = []
    Dir.foreach("#{Rails.root}/public/images/gallery/thumbs") do |thumb|
      if thumb =~ /.jpg/
        @thumbs.push(thumb)
      end
    end
    # data structure that I think I need
    # @thumbs = [ ['foo', { :class => 'bar', :title => nil }], 
    #             ['baz', { :class => 'asdf', :title => 'asdf' }],
    #             ['bar', { :clas => 'asdf', :title => nil}]]
  end

  def distributors
    @distributors = YAML.load_file("#{Rails.root}/config/distributors.yml").values.sort do |x, y|                                                                                         
      x['name'].sub(/^(the|a|an)\s/i, '') <=> y['name'].sub(/^(the|a|an)\s/i, '')    
    end
  end

  def sizes
    # user outermost keys for sorting
    @sizes = YAML.load_file("#{Rails.root}/config/sizes.yml").sort {|a,b| a[0]<=>b[0]}
    
    #flatten array, then pull out the even values (avoiding the keys)
    @sizes.flatten!   
    @sizes = @sizes.values_at(*(1...@sizes.size).step(2))
  end

  def custom
    @header = 'Custom Bags'
  end
  
  private
  
  def set_defaults
    @header = params[:action].titleize 
    @title = params[:action]
  end

end
