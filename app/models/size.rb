class Size 
  
  def self.all
    # use outermost keys for sorting
    @sizes = YAML.load_file("#{Rails.root}/config/sizes.yml").sort {|a,b| a[0]<=>b[0]}
    
    #flatten array, then pull out the even values (avoiding the keys)
    @sizes.flatten!   
    @sizes = @sizes.values_at(*(1...@sizes.size).step(2))
  end
  
end