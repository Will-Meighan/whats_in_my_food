class FoodSearch
  def food_count
    foods.count
  end

  def foods
    @foods ||= service.foods_by_ingredient(ingredient).map do |food_data|
      Food.new(food_data)
    end
  end

  private
    attr_reader :ingredient
end
