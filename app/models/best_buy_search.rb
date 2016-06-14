class BestBuySearch

  attr_reader :store_id, :store_type, :long_name, :city, :distance, :phone, :address, :hours

  def initialize(data)
    @store_id = data[:store_id]
    @store_type= data[:store_type]
    @name = data[:long_name]
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
    data.map do |store|
      self.new(store)
    end
  end
end
