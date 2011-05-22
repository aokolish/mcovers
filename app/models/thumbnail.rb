class Thumbnail
  
  def self.all 
    @thumbs = []
    Dir.foreach("#{Rails.root}/public/images/gallery/thumbs") do |thumb|
      if thumb =~ /.jpg/
        @thumbs.push(thumb)
      end
    end
    @thumbs
     # a.each_index do |i|  
     #   if i %= 
     # end
    # data structure that I think I need
    # @thumbs = [ ['foo', { :class => 'bar', :title => nil }], 
    #             ['baz', { :class => 'asdf', :title => 'asdf' }],
    #             ['bar', { :clas => 'asdf', :title => nil}]]
  end
  
end
