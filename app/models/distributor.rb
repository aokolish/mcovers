class Distributor

	def self.all
		@distributors = YAML.load_file("#{Rails.root}/config/distributors.yml").values.sort do |x, y|                                                                                         
      x['name'].sub(/^(the|a|an)\s/i, '') <=> y['name'].sub(/^(the|a|an)\s/i, '')
    end
	end

end