class FoodController < ApplicationController
  def index
    q = params[:q]

    conn = Faraday.new(url: "https://api.nal.usda.gov/") do |faraday|
      faraday.headers["FOOD-DATA-API-KEY"] = 'UKykCvjqPXCGPwTvorRAGS4imEV12e8z5kxqEUgy'
    end

    response = conn.get("/fdc/v1/search?api_key=UKykCvjqPXCGPwTvorRAGS4imEV12e8z5kxqEUgy\&generalSearchInput=#{q}")

    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:foods]
  end
end
