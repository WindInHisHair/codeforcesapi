require "codeforcesapi/version"
require_relative "codeforcesapi/CForces.rb"


module Codeforcesapi
  # Your code goes here...
  #
  #
  def self.problem(contestID, problemIndex) 
    CForces::Problem.new(contestID, problemIndex) 
  end

  def self.user(u)
    CForces::User.new(u)
  end
end
