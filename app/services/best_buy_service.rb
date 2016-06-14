class BestBuyService

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com")
    @connection.params["apiKey"] = ENV["BEST_BUY_API_KEY"]
    @connection.params["format"] = "json"
  end

  def json_request(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_stores(zip,radius,params=nil)
    encoded_zip = URI.encode(zip)
    encoded_radius = URI.encode(radius)
    json = json_request(@connection.get("/v1/stores(area(#{encoded_zip},#{encoded_radius}))?&show=storeId,storeType,longName,distance,address,hours,city,phone&pageSize=17"))
  end
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
# /v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,phone&pageSize=15
end
