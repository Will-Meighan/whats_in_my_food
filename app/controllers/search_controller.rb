class SearchController < ApplicationController
  def index
    ingredient = params[:ingredient]

    conn = Faraday.new(url: "https://fdc.nal.usda.gov/") do |faraday|
      faraday.headers["FOOD-DATA-API-KEY"] = 'UKykCvjqPXCGPwTvorRAGS4imEV12e8z5kxqEUgy'
    end

    response = conn.get("generalSearchInput=#{ingredient}")

    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:results]

    require "pry"; binding.pry

  end
end
