class FoodController < ApplicationController
  def index
    q = params[:q]

    conn = Faraday.new(url: "https://api.nal.usda.gov/") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["FOOD-DATA-API-KEY"]
    end

    response = conn.get("/fdc/v1/search?api_key=X-API-KEY\&ingredients=#{q}")

    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:foods][0..9]
  end
end
