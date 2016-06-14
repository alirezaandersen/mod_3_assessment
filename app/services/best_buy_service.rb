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

  def products(search_text, params=nil)
    encoded_search_text = URI.encode(search_text)
    json = json_request(@connection.get()
  end
end
