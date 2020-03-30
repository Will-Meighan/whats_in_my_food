class FoodDataService
  def foods_by_state(q)
    get_json("/fdc/v1/search?api_key=X-API-KEY\&ingredients=#{q}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["FOOD-DATA-API-KEY"]
    end
  end
end
