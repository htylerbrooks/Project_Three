class BeersController < ApplicationController

  respond_to :json

  def search
  end


  def results

    search_term = params[:q]
    @response = HTTParty.get("http://api.brewerydb.com/v2/search?q=#{search_term}&type=beer&key=aae5c8039d40d4cad7ada705c75745d2")
    @parsed = JSON.parse(@response.body)["data"]

    @beer_array = []
    @parsed.each do |beer_data|
      @beer_array << beer_data["name"]
      @beer_array << beer_data["labels"]
      @beer_array << beer_data["description"]
    end
  end




end
