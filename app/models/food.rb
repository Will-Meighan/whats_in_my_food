class Food
  attr_reader :description,
              :brandOwner,
              :ingredients,
              :gtinUpc,

  def initialize(attributes = {})
    @description       = attributes[:description]
    @brandOwner       = attributes[:brandOwner]
    @ingredients      = attributes[:ingredients]
    @gtinUpc   = attributes[:gtinUpc]
  end
end
