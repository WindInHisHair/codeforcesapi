require 'json'
require 'open-uri'


module CForces
class User 

  attr :name,  :rank, :rating

  def initialize(user)
    @url = 'https://codeforces.com/api/user.info?handles='+user

    @user = JSON.parse(open(@url).read) 

    if @user['status'] == 'OK'
      @rank = @user['result'].first['rank']
      @rating = @user['result'].first['rating'] 
    end 
  end
end
end