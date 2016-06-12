require 'Pry'

class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@owners = []

  def initialize(name)
    @name = name
    @@owners << self
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
  end

  def self.all
    @@owners
  end

  def self.reset_all
   self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
    # add object to fishes array in @pets hash
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
    # add object to fishes array in @pets hash
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end


  def walk_dogs
    #makes dogs moods = "happy"
    @pets[:dogs].each do |dog|
      #binding.pry
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |type, pet_array|
      pet_array.each do |pet|
        pet.mood = "nervous"
      end
      pet_array.clear
    end
  end

  def list_pets
    fish_count = @pets[:fishes].count
    cat_count = @pets[:cats].count
    dog_count = @pets[:dogs].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end