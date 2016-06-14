class BestBuySearch

  attr_reader :store_id, :store_type, :long_name, :city, :distance, :phone, :address, :hours, :name

  def initialize(data)
    #binding.pry
    @store_id = data[:storeId]
    @store_type= data[:storeType]
    @name = data[:longName]
    @city = data[:city]
    @distance = data[:distance]
    @phone = data[:phone]
    @address = data[:address]
    @hours = data[:hours]

  end

  def self.service
    BestBuyService.new
  end

  def self.find_by(params)
    zip = params[:search][:zip]
    radius = params[:search][:raidious]
    data = service.search_stores(zip,radius)
    #binding.pry
    data[:stores].map do |store|
      self.new(store)
    end
  end
end
