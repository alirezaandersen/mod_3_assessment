class BestBuyService

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com")
    @connection.params["apiKey"] = ENV["BEST_BUY_API_KEY"]
    @connection.params["format"] = "json"
  end

  def json_request(response)
    JSON.parse(response.body, symbolize_names: true)
  # binding.pry
  end

  def search_stores(search_location, params=nil)
    binding.pry
    encoded_search_text = URI.encode(search_location)
    # json = json_request(@connection.get("/v1/stores(area(#{search_location[zip]},#{search_location[radious]}))?&show=storeId,storeType,longName,city,phone&pageSize=15")
  end
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
# /v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,phone&pageSize=15
end
