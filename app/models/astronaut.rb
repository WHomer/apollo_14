class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age 
    average(:age)
  end

  # def total_time_in_space
  #   require 'pry'; binding.pry
  #   missions.select("sum(time_in_space) AS total_time")
  # end
end