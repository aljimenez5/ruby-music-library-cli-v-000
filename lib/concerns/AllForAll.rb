module AllForAll
  module ClassMethods
  
    def self.destroy_all
      self.all.clear
    end
    
    def create(name)
      new_artist = self.new(name)
      new_artist.save
      new_artist
    end
    
  end
  
  module InstanceMethods
    
    
  end
end