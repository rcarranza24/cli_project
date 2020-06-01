class Rickmorty
    
    attr_accessor :name, :id, :gender, :species, :status
    @@all = []
    def initialize(name, id)
        @name = name
        @id = id
        @@all << self
    end

    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end

    def self.find_by_name(name)
        self.all.detect{|rickmorty| rickmorty.name == name}
    end

    def self.all
        @@all
    end

    def update(gender, species, status)
        self.gender = gender
        self.species = species
        self.status = status
    end

    def has_details?
        self.gender && self.species && self.status
    end
end